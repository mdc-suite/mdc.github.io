---
title: "MDC Overview"
permalink: /mdc

toc: true
toc_label: "Index"
toc_min_header: 2
toc_max_header: 3
toc_sticky: true
---

Multi-Dataflow Composer (MDC) is an automated framework for the generation and management of coarse-grain reconfigurable (CGR) multi-functional architectures. 

MDC is meant to address the difficulty of mapping a set of different applications onto a CGR architecture, combining together a set of input dataflow specifications describing the desired system behaviours. MDC is capable of defining the actors that can be shared among the input dataflow specifications and applies a datapath-merging problem-solving algorithm to generate a CGR hardware substrate.

## The Multi-Dataflow Composer - Overview

MDC is meant to address the difficulty of mapping a set of different applications onto a CGR architecture, combining together a set of input dataflow specifications describing the desired system behaviours. MDC is capable of defining the actors that can be shared among the input dataflow specifications and applies a datapath-merging problem-solving algorithm to generate a CGR hardware substrate. MDC is composed of four main components: 


* **[Baseline MDC Core](/mdc/baseline)**: performing dataflow-to-hardware composition, by means of datapath merging techniques. 

* **[Structural Profiler](/mdc/profiler)**: performing the design space exploration of the implementable multi-functional systems, which can be derived from the input dataflow specifications set, to determine the optimal CGR substrate according to the given input constraints.

* **[Dynamic Power Manager](/mdc/powermanager)**: performing, at the dataflow level, the logic partitioning of the substrate to implement at the hardware level a clock gating or power gating strategy, and system modelling.

* **[Coprocessor Generator](/mdc/coprocessorgenerator)**: performing the complete dataflow-to-hardware customization of a Xilinx compliant multi-functional accelerator. Starting from the input dataflow specifications set, the customized accelerator can be either loosely coupled or tightly coupled to the main processor, according to the design needs, and also its drivers are derived.

