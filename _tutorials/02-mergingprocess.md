---
title: "MDC -- Merging Process"
permalink: /tutorials/mergingprocess

toc: true
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
To Run the MDC Merging Process
* **Create a new run configuration**: Run > Run configurations..., right click on Orcc compilation then select **New**.
* **Name**: chose a name for the configuration
* **Project**: select *Tutorial_EdgeDetection* project
* **Backend**
  * **Select a backend**: MDC
  * **Output Folder**: select an output folder. (e.g. “outputMDC/baseline”).

  {:refdef: style="text-align: center;"}
  ![](/assets/images/mdc/tutorials/projectMDC.png)
  {: refdef}

* **Options**
  * **Tick** “List of Networks to be Compiled and Merged”
  * **Number of Networks**: 2
  * **XDF List of Files**: select the two input dataflow networks *edgeDetection.roberts* and *edgeDetection.sobel*
  * **Merging Algorithm**: EMPIRIC
  * **Tick** “Generate RVC-CAL multi-dataflow”. And **Run**.

  {:refdef: style="text-align: center;"}
  ![](/assets/images/mdc/tutorials/multidataflowGenerationMDC.png)
  {: refdef}

This step merges the two input dataflow networks, through the selected datapath merging algorithm. Click on Run. Refresh the project folder to visualize the output folder with the generated multi-dataflow. In the generated networks you can notice as actors are shared, and functionalities of the two input networks are guaranteed by the insertion of the switching boxes.

{:refdef: style="text-align: center;"}
![](/assets/images/mdc/tutorials/multi-dataflow.svg)
{: refdef}
