/*
 station.ino
 This sketch receives UDP messages and sends data to icom ic-735
 Starting point was Arduino public domain Example UDPSendReceive.pde
 from Michael Margodis
 
 compiled with Arduino 2:1.0.5+dfsg2-4 running on 
 ubuntu 16.04 LTS (64Bit)

 created 11 Jul 2016
 by Andreas Rix (DL9LJ)

 */

#include <SPI.h>         
#include <Ethernet.h>
#include <EthernetUdp.h> // UDP library from: bjoern@cs.stanford.edu 12/30/2008

int ledPin = 2;
int tunePin = 4;
int sensorPin0 = A0;  
int sensorPin1 = A1;
int adc0 = 0;
int adc1 = 0;
int temp0 = 0;
int temp1 = 0;

char icom[] = {
  0xFE, 0xFE, 0x04, 0xE0, 0x05, 0x00, 0x00, 0x08, 0x01, 0xFD };

// Enter the MAC address and IP address for your arduino ethernet
// The IP address will be dependent on your local network:
byte mac[] = {  
  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };  
IPAddress ip(192, 168, 2, 177);

unsigned int localPort = 8888;      // local port to listen on

// buffers for receiving and sending data
char packetBuffer[UDP_TX_PACKET_MAX_SIZE]; //buffer to hold incoming packet,
char  ReplyBuffer[] = "acknowledged";       // a string to send back

// An EthernetUDP instance to let us send and receive packets over UDP
EthernetUDP Udp;

void setup() {
  pinMode(ledPin, OUTPUT);
  pinMode(tunePin, OUTPUT);  
  digitalWrite(ledPin, LOW);
  digitalWrite(tunePin, LOW); 
  // start the Ethernet and UDP:
  Ethernet.begin(mac,ip);
  Udp.begin(localPort);

  Serial.begin(1200);
}

void loop() {

  // if there's data available, read a packet
  int packetSize = Udp.parsePacket();
  int band, i;

  adc0 = analogRead(sensorPin0);
  adc1 = analogRead(sensorPin1);  
   
  if(packetSize)
  {
    // read the packet into packetBufffer
    Udp.read(packetBuffer,UDP_TX_PACKET_MAX_SIZE);
    band = int (packetBuffer[0]);
    band = band - 0x30;
    // Serial.print(band);

    switch (band) {
    case 1:    // 160m
      icom[8] = 0x01;
      icom[7] = 0x80;
      break;
    case 2:    // 80m
      icom[8] = 0x03;
      icom[7] = 0x50;
      break;
    case 3:    // 40m
      icom[8] = 0x07;
      icom[7] = 0x00;
      break;
    case 4:    // 30m
      icom[8] = 0x10;
      icom[7] = 0x00;
      break;
    case 5:    // 20m
      icom[8] = 0x14;
      icom[7] = 0x00;
      break;
    case 6:    // 17m
      icom[8] = 0x18;
      icom[7] = 0x00;
      break;
    case 7:    // 15m
      icom[8] = 0x21;
      icom[7] = 0x00;
      break;
    case 8:    // 12m
      icom[8] = 0x24;
      icom[7] = 0x00;
      break;
    case 9:    // 10m
      icom[8] = 0x28;
      icom[7] = 0x00;
      break;
    case 0x0A:  // On
      digitalWrite(ledPin, HIGH);
      break;
    case 0x0B:  // Off
      digitalWrite(ledPin, LOW);
      break;
    case 0x0C:  // Bypass
      digitalWrite(tunePin, HIGH);
      delay(100);
      digitalWrite(tunePin, LOW);
      break;
    case 0x0D:  // Memory Tune
      digitalWrite(tunePin, HIGH);
      delay(2000);
      digitalWrite(tunePin, LOW);
      break;
    case 0x0E:  // Full Tune
      digitalWrite(tunePin, HIGH);
      delay(4000);
      digitalWrite(tunePin, LOW);
      break;
    default:
      break;
  }
    for (i=0; i<10; i++)
       Serial.print(icom[i]);
    
    // send a reply, to the IP address and port that sent us the packet we received
    Udp.beginPacket(Udp.remoteIP(), Udp.remotePort());
    temp0 = adc0 + 1000;
    temp1 = adc1 + 1000;
    itoa(temp0, ReplyBuffer, 10);
    Udp.write(ReplyBuffer);
    //Udp.write(',');
    itoa(temp1, ReplyBuffer, 10);
    Udp.write(ReplyBuffer);   
    Udp.endPacket();
  }
  delay(10);
}




