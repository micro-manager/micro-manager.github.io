We have several primary projects that are wrapped up in the "Micro-Manager 2.0" project. This page will be used to track our progress on each of these projects.

=== Acquisition Engine ===

A new acquisition engine that, compared to the existing engine, is more flexible, easier to modify, and better-exposed in the API.

'''Status: pre-alpha'''

=== Display Windows ===

New display windows for viewing data.

'''Status: alpha'''

=== Data workflow ===

A replacement for the linear DataProcessor system, which is more flexible, is capable of branching image pipelines, and can easily bundle up images for analysis in groups (e.g. all Z slices for a given timepoint).

'''Status: not started'''

=== API ===

All above changes are integrated into the API. Additionally, the API now exposes more details about Micro-Manager's data model, allowing users to easily access image data and metadata and construct their own datasets, without having to rely on the "Acquisition" object.

See [https://micro-manager.org/wiki/Version_2.0_API this page] for more details.

'''Status: alpha; dependent on other items'''
