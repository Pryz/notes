I/O Elevators
=============

-   CFQ (Completely Fair Queuing)

    -   Per process queue

    -   Each process queue gets fixed time slice (process priority)

    -   Default algorithm for RHEL

-   Deadline

    -   Two queues per device, one for read and one for writes

    -   I/Os dispatched based on time spent in queue

    -   Recommended for single instance databases with dedicated storage

-   Noop

    -   FIFO

    -   Simple I/O Merging

    -   Lowest CPU Cost

    -   Recommended for CPU-limited env


