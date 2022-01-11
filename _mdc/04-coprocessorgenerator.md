---
title: "Coprocessor Generator"
permalink: /mdc/coprocessorgenerator

toc: true
toc_label: "Index"
toc_min_header: 2
toc_max_header: 3
toc_sticky: true
---

MDC tool is able of automatically composing, synthesizing and deploying a runtime reconfigurable coprocessors compliant with the Xilinx Vivado Design Suite. The MDC Coprocessor Generator, generates the multi-dataflow graph merging the input dataflow specifications as described in [Baseline MDC Core](/mdc/baseline), then starting from the generated multi-dataflow MDC generates the corresponding CGR core. In parallel, starting from the composed multi-dataflow, MDC generates the files and the necessary logic to embed the computing core into a configurable Template Interface Layer (TIL). Finally, to easy deploy and use the coprocessor, MDC provides the Xilinx Vivado scripts, to automatically embed the logic into a processor-coprocessor architecture, and the software drivers to ease its use. 

