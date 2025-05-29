#include <stdio.h>
#include <stdlib.h>
#include "../include/queue.h"

int main() {
    queue *q = malloc(sizeof(queue));
    if(!q) {
        perror("malloc failed");
        return 1;
    }
    initQueue(q);

    enqueue(q, 10);
    printq(q);
    enqueue(q, 20);
    printq(q);
    enqueue(q, 30);
    printq(q);

    dequeue(q);
    printq(q);

    dequeue(q);
    printq(q);

    dequeue(q);
    printq(q);
    free(q);
}
