# CoinMunity Functionality Explained

## Principals

The **coinmunity** is based on trust and, as in real life, trust needs to be
gained with efforts and a proven record of authenticity. For this reason there
will be a **decentralized** trust score system.

#### Why decentralized?

Because the platform will **not** be able to **control or influence** the trustiness of
a person or post. The community will be able to decide what they consider
trustworthy or not.

## Trustiness Logic

When we meet somebody in real life we give them the minimum amount of trust necessary
to start building a true relationship with them, for then increasing it or decreasing
it based on his / her **behaviours** or **statements**. This is the same logic that we are
going to use to evaluate the trustiness of a person and how it's going to evolve on time.

## Getting Started

Each user will start his / her journey with **10** `trustiness` points while the
maximum and minimum amounts are respectively `+infinite` and `-infinite` (*we can
review this during the development process*).

## Earning and Losing points

A user can earn trustiness points by posting anything he / she wants in the feed
that has been **previously verified** and it's **not a spam**. If the post gets
**trusted** by other participants of the coinmunity the user is going to automatically
earn trustiness points that will increase his / her **reliability** in the community.

In the contrary, if the user gets **reported**, he / she will lose the double of
the default trust points (`-0.2 trustiness points`).

## Trust or Report

When **trusting** a post we assume that you previously verified the information
that you are trusting. This is why we ask for the **source** where you
confirmed it. Each source will have it's level of authenticity that will influence the
weight of the given trust. The person will be able to add a screenshot or the link to the website
where he / she verified the authenticity of the post.

#### algorithm:

> based on a single post

*the default / initial value of a trust is always 0.1*

`(trust / source_athenticity) * COUNT(post.trusts)`

Trusting can be done only by **trustworthy coinmunity members** (*with at least 10
trustiness points*).


The **reporting** of a post is quite similar to the trusting but, instead
of the source, we will have the reason why this post has been reported.
Reporting can be done only by **trustworthy coinmunity members** (*with at least 10
trustiness points*).

> as previously mentioned each report it's equal to -0.2 trustiness points

## Silence

If a person trustiness drops below **-10** points it's going to be silenced for
as long as he doesn't return over -10 points.

In this case, the only way for the user to be able to be part of the community again,
is to demonstrate his / her commitment to it. This can be done each time that you login
into the platform. Each user will receive **0.5** points every time he / she logs into the
platform, with a maximum of **once per day**.
