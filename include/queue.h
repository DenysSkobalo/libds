#ifndef QUEUE_H
#define QUEUE_H

#define SIZE 64
typedef struct {
    int data[SIZE];
    int front;
    int rear;
} queue;

void initQueue(queue *q);
int isEmpty(queue *q);
int isFull(queue *q);
void enqueue(queue *q, int value);
int dequeue(queue *q);
void printq(queue *q);

#endif
