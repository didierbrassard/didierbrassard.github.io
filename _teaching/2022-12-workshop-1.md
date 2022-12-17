---
title: "Measurement error and the NCI univariate method"
collection: teaching
type: "Coding club workshop"
permalink: /teaching/2022-12-nci-1
venue: "School of Human Nutrition, McGill University"
date: 2022-12-09
location: "Québec, Canada"
---

<img src="/images/talks/2022-12-nci-1.png" width="80%" style="display: block; margin: auto;"/>

Description
======
This workshop is an introduction to measurement error in nutrition research, particularly random errors. While it is obvious that a systematic error (difference) between the "true" value and its measurement can be a problem, the impact of random errors is often more subtle. However, in many cases, random errors can be as problematic as systematic errors if they are ignored. The theory is covered in the presentation, while the practical aspects (SAS codes) are covered in the corresponding Github respository.

The objectives of the workshop are as follows:  

1. Theory
- Understand difference between systematic/random errors
- Understand the classical measurement error model
- Know the impacts of random errors on the distribution of a variable
- Know the assumptions and steps of the NCI methods  

2. Practice/Coding
- Recognize assumptions
- Identify variables, covariables, transformation
- Understand the difference between ”one-part” and “two-part” models  

3. Exercises
- Explore application of the NCI univariate method to obtain a distribution

Presentation
======

Slides for the workshop are available online: [English version on Google Drive](https://drive.google.com/file/d/1VKxCEDkiGSCbAYVioob-s4krjDJut4uT/view?usp=sharing)

I have also written two blog posts about measurement error: *[‘Statistical concept you should know’: random and systematic measurement errors](https://didierbrassard.github.io/posts/2022/11/blog-post-6/)* and *[Impact of random errors: two nutrition examples](https://didierbrassard.github.io/posts/2022/11/blog-post-7/)*. These posts may help better understand some concepts from the presentation.

Code
======

Supporting SAS codes to explore basic aspects of random measurement error and application of the NCI univariate method are [available in a Github repository](https://github.com/didierbrassard/nci_workshop). The data used for example is a subset of the Canadian Community Health Survey (CCHS) 2015 - Nutrition including only participants aged 20 to 30 years old. 

**Acknowledgement:** I am incredibly grateful to Professors Anne-Sophie Morisset (Université Laval) and Bénédicte Fontaine-Bisson (University of Ottawa) for their financial support and assistance in organizing the original French version of this workshop.
