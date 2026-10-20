# Giotto Suite <img src="https://raw.githubusercontent.com/giotto-suite/Giotto/suite/man/figures/GiottoLogo.png" align="right" alt="" width="160" />

Giotto Suite is a modular ecosystem of R packages for processing, analyzing, and visualizing **spatial multi-omics data at all scales and multiple resolutions**. The underlying framework is generalizable to virtually all current and emerging spatial technologies, including *in situ* hybridization (seqFISH+, MERFISH, osmFISH, CosMx), sequencing (Slide-seq, Visium, STARmap, Seq-Scope, Stereo-seq), and imaging-based multiplexing/proteomics (CyCIF, MIBI, CODEX). These technologies differ in resolution (subcellular, single cell, or multiple cells), spatial dimension (2D vs 3D), molecular modality (protein, RNA, DNA, ...), and throughput (number of cells and analytes).

Documentation, tutorials, and examples: **[giottosuite.com](https://www.giottosuite.com)**

## Installation

Install Giotto Suite with:

```r
pak::pkg_install("giotto-suite/Giotto")
```

This installs Giotto together with the core modules it depends on. For questions and community help, visit the Giotto [Discussions](https://github.com/giotto-suite/Giotto/discussions) page.

## Ecosystem

Giotto Suite is built from distinct modules, which makes it straightforward to extend and adapt to new high-throughput spatial technologies.

### Core modules

| Package | Description |
|---|---|
| [Giotto](https://github.com/giotto-suite/Giotto) | The umbrella spatial-omics toolbox. Data processing, integration, spatial analyses, dimension reduction, and clustering. |
| [GiottoClass](https://github.com/giotto-suite/GiottoClass) | The `giotto` object and subobject class definitions, data ingestion, data access, and core spatial frameworks. |
| [GiottoVisuals](https://github.com/giotto-suite/GiottoVisuals) | Visualization: dimension reduction plots, aggregated and subcellular spatial plots, color scales, and plot output handling. |
| [GiottoUtils](https://github.com/giotto-suite/GiottoUtils) | Internal infrastructure, package imports, and printing. Mainly used internally. |

### Add-on modules

| Package | Description |
|---|---|
| [GiottoData](https://github.com/giotto-suite/GiottoData) | Mini example datasets for rapid testing, plus helpers to download and import publicly available datasets. |
| [GiottoDisk](https://github.com/giotto-suite/GiottoDisk) *(in development)* | On-disk processing for large-scale spatial data. A unified storage layer (Parquet/Arrow, HDF5, BPCells, TileDB) gives lazy, file-backed representations of expression matrices and spatial geometries, so analyses can scale beyond memory. Also provides project management for on-disk artifacts and snapshots. |
| [GiottoDB](https://github.com/giotto-suite/GiottoDB) *(experimental)* | Database-backed processing for scalable analysis. |

## Website guide

- **Get started:** the Giotto object, the Giotto ecosystem, configuration, and installation FAQs.
- **Documentation:** all functions grouped by purpose (helpers, getters and setters, visualization, ...).
- **Examples:** end-to-end analyses for different technologies and datasets.
- **Tutorials:** working with Giotto (analysis, visualization, cloud computing, ...).
- **News:** the changelog for every release and recordings of previous presentations.

## References

- [Chen, J.G., Chávez-Fuentes, J.C., et al. Giotto Suite: a multi-scale and technology-agnostic spatial multi-omics analysis ecosystem. bioRxiv (2023).](https://www.biorxiv.org/content/10.1101/2023.11.26.568752v1)
- [Dries, R., Zhu, Q., et al. Giotto: a toolbox for integrative analysis and visualization of spatial expression data. Genome Biology (2021).](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-021-02286-2)
- [Dries, R., Chen, J., et al. Advances in spatial transcriptomic data analysis. Genome Research (2021).](https://genome.cshlp.org/content/31/10/1706.long)
- [Del Rossi, N., Chen, J., et al. Analyzing Spatial Transcriptomics Data Using Giotto. Current Protocols (2022).](https://currentprotocols.onlinelibrary.wiley.com/doi/abs/10.1002/cpz1.405)
