RAM
===

CPU
===

-   runq = number of process waiting CPU time

-   cswitch (context switch) = change of process = parallel calculations

-   system load

    -   load average : 1min 5min 15min (over the last Xmin)

    -   traffic analogy : X single processor(s) = X bridge(s) of traffic

        -   load (i.e a single processor)

            -   0 = no traffic

            -   0,70 = begin to check if there is something wrong

            -   1 = full traffic without "contention"

            -   \> 1 = full traffic + waiting processes

            -   3 = 3x the full traffic capacity

Commands & tools
================

GANGLIA
-------

-   CPU graph

    -   User / System CPU : utilisation du CPU user/applicatif et system

        -   Nice CPU : %CPU time occupé par des process à faible prio

        -   WAIT CPU : %tps passé par le CPU à attendre des remontées d’IO disques (= CPU wio)

            -   Idle CPU : %tps CPU à glander

VMSTAT
------

-   R : running queue

-   B : blocked (wait io - wio | blocked)

-   IN : Number of interrupts

-   CS : Number of context switchs

-   US : %CPU time sur User Thread

-   SYS : %CPU time sur Kernel + Interrupts

-   WA : %CPU idle à case d’un wait IO

-   ID : %CPU time complétement idle

-   BI : IO Write

-   BO : IO Read

-   SI : swap in = vers la RAM

-   SO : swap out = vers le disque

SAR
---

``` bash
sar -q (queue length, task list length + load avg)
```

tag : perf, audit, troubleshooting

