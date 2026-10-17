# Setup timing review

**Author:** MD Soahil Ahmed

Setup WNS is negative in six corners: `ss_100C_1v40`, `ss_n40C_1v28`, `ss_n40C_1v35`, `ss_n40C_1v40`, `ss_n40C_1v44`, and `ss_n40C_1v60`. These values indicate setup timing problems in the reported conditions. The most severe case is `ss_n40C_1v28` at −30.7252 ns; its setup TNS is −13550.8096 ns.

The result pattern highlights slow-process, low-voltage corners at −40 °C as priority cases for investigation. Review the original path reports to identify critical endpoints, path depth, cell delay, interconnect delay, clock assumptions, and constraint coverage before proposing fixes. Do not infer a root cause from aggregate WNS/TNS alone.
