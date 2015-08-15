Table : pg\_stat\_user\_tables

-   heap\_blks\_read : Number of disk blocks read from this table

-   heap\_blks\_hit : Number of buffer hits in this table

-   ratio : cache hit rate. Need to be about 99%. If not increase the cache size

rtsdb=\# SELECT sum(heap\_blks\_read) as heap\_read, sum(heap\_blks\_hit) as heap\_hit, sum(heap\_blks\_hit)/(sum(heap\_blks\_hit)`sum(heap_blks_read)) as ratio FROM pg_statio_user_tables;
 heap_read |  heap_hit  |         ratio
-----------`------------+------------------------ 5222966 | 3705936846 | 0.99859263242097212062 (1 row)

rtsdb=\# SELECT relname, 100\*idx\_scan/(seq\_scan+idx\_scan) percent\_of\_times\_index\_used, n\_live\_tup rows\_in\_table FROM pg\_stat\_user\_tables WHERE seq\_scan + idx\_scan \> 0 ORDER BY n\_live\_tup DESC; relname | percent\_of\_times\_index\_used | rows\_in\_table ------------------------`-----------------------------`--------------- baselinecontent | 99 | 441853 version | 99 | 259329 ruleartifact | 99 | 199570 ruleartifactsibling | 99 | 199570 rplftrgt | 99 | 117748 definition | 99 | 115853 bompathentry | 94 | 43724 brstudio | 88 | 43075 ruleprojecttag | 88 | 41477

