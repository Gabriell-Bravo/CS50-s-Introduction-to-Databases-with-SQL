# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

Random partitioning is worth adopting when the main goal is to keep storage balanced. Because each observation is equally likely to land on any boat, a burst of midnight readings does not pile onto a single boat, and no boat becomes a hotspot just because AquaByte is busier at one hour. The cost is that a range query, such as “everything between midnight and 1am,” cannot be answered from one boat: every boat might hold part of that range, so the researcher has to query all of them and combine the results.

## Partitioning by Hour

Partitioning by hour is attractive when researchers usually ask for a window of time. All observations from midnight to 1am live on Boat A, so that query touches one boat instead of the whole fleet, and the boats can be scaled around the kinds of questions people actually ask. It is a poor fit for AquaByte’s schedule, though: most observations happen between midnight and 1am, so Boat A stores almost everything while Boats B and C stay nearly empty. The busy boat then becomes both a storage bottleneck and a single point of load.

## Partitioning by Hash Value

Hashing the timestamp spreads observations evenly even when collection is concentrated in one hour, and a lookup for one exact timestamp can be routed to a single boat because the hash of that timestamp is known in advance. Range queries do not get the same benefit. Hash values for nearby times are scattered, so “everything between midnight and 1am” still has to run on every boat. Hash partitioning is the better default when point lookups matter more than time-range scans, and hour partitioning is better when the opposite is true.
