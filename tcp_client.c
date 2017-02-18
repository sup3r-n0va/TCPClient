#include <stdio.h>	/*for printf() and fprintf() */
#include <sys/socket.h> /*for socket(), connect(), send(), and recv() */
#include <arpa/inet.h>  /*for sockaddr_in and inet_addr() */
#include <stdlib.h>     /*for atoi() */
#include <unistd.h>     /* for close() */
#include <string.h>	/* for memset function */
#include <netinet/in.h> /* for inet_addr() */

#define RCVBUFSIZE 32   // size of buffer

void DieWithError(char *errormessage);  // Error handling function

int main(int argc, char *argv[])
{

	int sock;			//socket descriptor
	struct sockaddr_in echoServAddr; //Echo server address
	unsigned short echoServPort;	//Echo server port
	char *servIP;			// Server IP address (dotted quad)
	char *echoString;		//String to send to echo server
	char echoBuffer[RCVBUFSIZE];	//buffer for echo string 
	unsigned int echoStringLen;	//Length of string to echo
	int bytesRcvd, totalBytesRcvd;  /* Bytes read in single recv()
					and total bytes read */

	if ((argc < 3) || (argc > 4)) 	//test for correct number of arguements
	{
		fprintf(stderr, "Usage: %s <Server IP> <Echo Word> [<Echo Port>]\n",
			argv[0]);
		exit(1);
	}

	servIP = argv[1];		//First arg: server IP address
	echoString = argv[2];		//Second arg: string to echo 

	if (argc == 4)
		echoServPort = atoi(argv[3]);	//Use given port, if any
	else
		echoServPort = 7;		//7 is the well known port
						//for echo service

	//Create a reliable, stream socket using TCP
	if ((sock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
		DieWithError("socket() failed");

	//construct the server address structure 
	memset(&echoServAddr, 0, sizeof(echoServAddr)); //zero out structure
	echoServAddr.sin_family  = AF_INET;		//Internet address family
	echoServAddr.sin_addr.s_addr = inet_addr(servIP); //Server IP address
	echoServAddr.sin_port  = htons(echoServPort);	//Server port

	//Establish the connection to the echo server
	if (connect(sock, (struct sockaddr *) &echoServAddr, sizeof(echoServAddr)) < 0)
		DieWithError("connect() failed");

	echoStringLen = strlen(echoString);		// Determine input length

	// send string to the server 
	if (send(sock, echoString, echoStringLen, 0) != echoStringLen)
		DieWithError("send() sent a different number of bytes than expected");
	
	// Recieve the same string back from the server
	totalBytesRcvd = 0;
	printf("Recieved: ");				//setup to print echoed string
	while (totalBytesRcvd < echoStringLen)
	{
		//Recieve up to the buffer size (minus 1 to leave space for a null
		//terminator) byte from the sender 
		if ((bytesRcvd = recv(sock, echoBuffer, RCVBUFSIZE -1, 0)) <= 0)
			DieWithError("recv() failed or connection closed prematurely");
		// Keep tally of total bytes
		totalBytesRcvd += bytesRcvd;
		// Terminate the string	
		echoBuffer[bytesRcvd] = '\0';
		//Print the echo buffer
		printf(echoBuffer);
	}
	// print a final linefeed
	printf("\n");



	close(sock);
	exit(0);
}
