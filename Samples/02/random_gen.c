#include <stdio.h>		// printf
#include <stdlib.h>		// random number functions
#include <sys/time.h>	// gettimeofday
#include <limits.h>		// LONG_MAX
#include <math.h>		// floor
#include <unistd.h>		// read
#include <sys/types.h>	// open
#include <sys/stat.h>	// open
#include <fcntl.h>		// open

double dtime(){
	double t;
	struct timeval tv;
	gettimeofday(&tv, NULL);
	t = tv.tv_sec + ((double)tv.tv_usec)/1e6;
	return t;
}

void urandom_ini(){
	double tt = dtime() * 1e6;
	double mx = (double)LONG_MAX;
	srand48((long)(tt - mx * floor(tt/mx)));
}

int main(int argc, char **argv){
	int i;
	do{
		long r_ini;
		int fd = open("/dev/random", O_RDONLY);
		if(-1 == fd){
			fprintf(stderr,"Error open /dev/random!\n");
			urandom_ini(); break;
		}
		if(sizeof(long) != read(fd, &r_ini, sizeof(long))){
			fprintf(stderr,"Error read /dev/random!\n");
			urandom_ini();
			close(fd); break;
		}
		close(fd);
		srand48(r_ini);
	}while(0);
	for(i = 0; i < 10; i++){
		printf("%g\n", drand48());
	}
	printf("\n");
	return 0;
}
