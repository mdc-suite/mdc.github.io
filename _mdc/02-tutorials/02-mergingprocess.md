---
title: "MDC -- Baseline"
permalink: /tools/mdc/tutorials/mergingprocess

toc: true
toc_label: "Index"
toc_min_header: 2
toc_max_header: 3
toc_sticky: true
---

This tutorial covers the following topic:

* application description
* launch the MDC runtime workspace
* import a new project
* generate a multi-dataflow using MDC (MDC merging process)


Requirements:
* [Installation guide](/tools/mdc/tutorials/setup)
* [Get MDC Applications](https://github.com/mdc-suite/mdc-test)

## Application description

In this tutorial it is adopted an edge detection application involving two different algorithms: Sobel and Roberts. Both
algorithms consider the convolution of two kernels with a grayscale image, in order to highlight the high-frequency variations due to the horizontal and vertical edges. Following figure illustrates the convolution of kernels (x and y) of Roberts (on the left) and Sobel (on the right) operators with an input image (A).

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

## Launch the MDC runtime workspace

## Import a new project into worspace

## MDC Merging Process
