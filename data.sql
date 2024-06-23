CREATE TABLE public.dog (
    id serial primary key, 
    name text NOT NULL,
    description text NOT NULL,
    dob date NOT NULL,
    owner text
);


COPY public.dog (id, name, description, dob, owner) FROM stdin;
1	Tiffany	A golden Poodle known for being calm.	2020-01-07	\N
3	Keith	A golden Poodle known for being calm.	2013-10-30	\N
5	Alicia	A spotted Poodle known for being affectionate.	2021-07-31	\N
7	Kimberly	A grey Poodle known for being protective.	2019-02-22	\N
9	Carol	A tan Poodle known for being protective.	2010-07-01	\N
11	John	A tan Golden Retriever known for being friendly.	2017-12-31	\N
13	Kristin	A grey Golden Retriever known for being friendly.	2009-02-24	\N
15	Tami	A black Golden Retriever known for being curious.	2012-04-30	\N
17	Elizabeth	A black Golden Retriever known for being curious.	2018-10-23	\N
19	Joshua	A brindle Golden Retriever known for being affectionate.	2013-02-20	\N
21	Lisa	A brindle Pomeranian known for being calm.	2022-04-16	\N
23	John	A spotted Chihuahua known for being playful.	2018-08-11	\N
25	Kimberly	A tan Golden Retriever known for being playful.	2011-11-04	\N
27	Jeremy	A golden Beagle known for being calm.	2010-08-29	\N
29	Brittany	A tan Chihuahua known for being affectionate.	2020-12-04	\N
31	Melissa	A spotted Poodle known for being protective.	2021-12-21	\N
33	Jennifer	A golden Dachshund known for being playful.	2011-05-25	\N
35	Bobby	A golden German Shepherd known for being affectionate.	2018-05-07	\N
37	Benjamin	A black Boxer known for being protective.	2017-08-05	\N
39	Karen	A golden Siberian Husky known for being energetic.	2009-03-23	\N
41	Timothy	A brindle Poodle known for being loyal.	2019-03-16	\N
43	Brandon	A grey Siberian Husky known for being curious.	2009-11-04	\N
47	Shawn	A white Chihuahua known for being calm.	2012-01-23	\N
49	Mary	A grey Great Dane known for being affectionate.	2022-08-10	\N
51	Jacqueline	A golden Shih Tzu known for being playful.	2009-11-22	\N
53	John	A tan Yorkshire Terrier known for being loyal.	2023-01-05	\N
55	Scott	A grey Boxer known for being affectionate.	2008-12-23	\N
57	Larry	A golden Pomeranian known for being curious.	2020-04-09	\N
59	Nicole	A spotted Bulldog known for being loyal.	2009-02-23	\N
61	Nicole	A white Great Dane known for being protective.	2014-05-07	\N
63	Maureen	A grey Shih Tzu known for being protective.	2016-01-05	\N
65	Lauren	A white Great Dane known for being protective.	2021-11-07	\N
67	Steven	A tan Boxer known for being affectionate.	2011-12-22	\N
69	Cynthia	A grey Doberman known for being playful.	2008-12-31	\N
71	Stacey	A golden Chihuahua known for being curious.	2014-03-22	\N
73	Carlos	A brindle Dachshund known for being energetic.	2021-12-07	\N
75	Audrey	A spotted Boxer known for being protective.	2019-11-18	\N
77	Brittany	A tan Siberian Husky known for being friendly.	2022-01-26	\N
79	Jennifer	A spotted Shih Tzu known for being energetic.	2023-03-09	\N
81	Trevor	A tan Dachshund known for being curious.	2020-04-27	\N
83	Dawn	A black Bulldog known for being friendly.	2020-01-17	\N
85	Charles	A grey Rottweiler known for being playful.	2014-02-05	\N
87	Kristy	A tan Dachshund known for being playful.	2022-03-22	\N
89	Andrew	A black Bulldog known for being curious.	2021-08-26	\N
91	Steven	A brindle Great Dane known for being calm.	2011-11-15	\N
93	William	A white German Shepherd known for being friendly.	2017-03-19	\N
95	Kathryn	A grey Great Dane known for being loyal.	2020-11-03	\N
97	Richard	A brown Chihuahua known for being protective.	2019-01-28	\N
99	Donna	A grey Doberman known for being affectionate.	2010-08-26	\N
101	Lisa	A spotted German Shepherd known for being loyal.	2020-07-30	\N
45	Prancer	A demonic, neurotic, man hating, animal hating, children hating dogs that look like gremlins.	2008-12-19	Josh
\.

