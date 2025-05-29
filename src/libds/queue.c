#include <stdio.h>
#include <stdlib.h>
#include "../../include/queue.h"

void initQueue(queue *q) {
    q->front = 0;
    q->rear = 0;
}

int isEmpty(queue *q) {
    return q->front == q->rear;
}

int isFull(queue *q) {
    return (q->rear + 1) % SIZE == q->front;
}

void enqueue(queue *q, int value) {
    if(isFull(q)) {
        printf("Queue is full!\n");
        return;
    }
    q->data[q->rear] = value;
    q->rear = (q->rear + 1) % SIZE;
}

int dequeue(queue *q) {
    if(isEmpty(q)) {
        printf("Queue is empty!\n");
        return -1;
    }
    int value = q->data[q->front];
    q->front = (q->front + 1) % SIZE;
    return value;
}

void printq(queue *q) {
    if(isEmpty(q)) {
        printf("Queue is empty!\n");
        return;
    }

    printf("Queue: ");
    int i = q->front;
    while(i != q->rear) {
        printf("%d ", q->data[i]);
        i = (i+1) % SIZE;
    }
    printf("\n");
}


