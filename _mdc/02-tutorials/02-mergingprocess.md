---
title: "MDC -- Merging Process"
permalink: /tools/mdc/tutorials/mergingprocess

toc: true
toc_label: "Index"
toc_min_header: 2
toc_max_header: 3
toc_sticky: true
---

This tutorial covers the following topic:

* application description
* import a new project
* generate a multi-dataflow using MDC (MDC merging process)


Requirements:
* [Installation guide](/tools/mdc/tutorials/setup)
* [Get MDC Applications](https://github.com/mdc-suite/mdc-test)

## Application description
**This tutorial refers to the [Tutorial_EdgeDetection](https://github.com/mdc-suite/mdc-test/tree/master/ApplicationProjects/Tutorial_EdgeDetection/src/edgeDetection) application.**

In this tutorial it is adopted an edge detection application involving two different algorithms: Sobel and Roberts. Both algorithms consider the convolution of two kernels with a grayscale image, in order to highlight the high-frequency variations due to the horizontal and vertical edges. Following figure illustrates the convolution of kernels (x and y) of Roberts (on the left) and Sobel (on the right) operators with an input image (A).

{:refdef: style="text-align: center;"}
![](/assets/images/mdc/tutorials/edgeDetection.png)
{: refdef}

Following figure illustrate the single networks for Roberts and Sobel algorithms.

{:refdef: style="text-align: center;"}
![Roberts](/assets/images/mdc/tutorials/roberts.svg)
{: refdef}

{:refdef: style="text-align: center;"}
![Sobel](/assets/images/mdc/tutorials/sobel.svg)
{: refdef}

The single networks and HDL component libraries have been created using [CAPH tool](http://caph.univ-bpclermont.fr). CAPH is a framework for the specification, simulation and
implementation of stream processing applications based on a [dynamic Dataflow MoC](https://www.researchgate.net/publication/278698706_CAPH_A_language_for_implementing_stream-processing_applications_on_FPGAs).

## Import a new project into workspace

**If you are using the developer version, you firstly need to run the Runtime Workspace, launching the Eclipse Application as described in the [Installation Guide](/tools/mdc/tutorials/setup).**

The Runtime Workspace appears as an Eclipse IDE. To import the project:

* File > Import... > General > Existing Project into Workspace
* Browse to  Tutorial_EdgeDetection
* OK > Finish

{:refdef: style="text-align: center;"}
![](/assets/images/mdc/tutorials/mdc-runtimeWS.png)
{: refdef}

## MDC Merging Process
