Burley Lit Shader for URP
=============
![Burley Screenshot](/Documentation/images/Burley.png)

Description
------------
Lit Shader with Burley (Disney) diffuse model for Unity Universal Render Pipeline.

Based on Default Lit shader from URP package. Diffuse calculations was replaced and added in this package files, other things remained the same.

This is Frostbite's version with renormalization of energy.

Lighting function was changed from `LightingPhysicallyBased()` and `LightingLambert()` in URP `Lighting.hlsl` to `LightingBurley()` in `BurleyLighting.hlsl`.

Burley diffuse model function is located in `BurleyBRDF.hlsl` file.

Notes
------------
* This shader uses `UniversalForwardOnly` pass because otherwise it would require edit URP's `StencilDeferred.hlsl` or `Lighting.hlsl` files (point below).
* You can change diffuse model of all Default Lit materials to Burley's by customizing URP package and replacing `Lighting.hlsl` file from this package (URP folder). In this case, you won't be able to choose diffuse model from Default (Lambert) or Burley - all `Lit` materials will have Burley diffuse model by default.
* In case if you want use this shader with Deferred Path more efficient, you need to follow the point above.

Comparison
------------
[Lambert and Burley comparison](Documentation/Comparison.md)

Credits
------------
* [Brent Burley. "Physically Based Shading at Disney".](https://media.disneyanimation.com/uploads/production/publication_asset/48/asset/s2012_pbs_disney_brdf_notes_v3.pdf)
* [Sébastien  Lagarde, Charles de Rousiers. "Moving Frostbite to Physically Based Rendering 3.0".](https://seblagarde.wordpress.com/wp-content/uploads/2015/07/course_notes_moving_frostbite_to_pbr_v32.pdf)
* [G-Man model used in comparison (Half-Life: Alyx).](https://sketchfab.com/3d-models/gman-from-half-life-alyx-e1d7293117e64f458e0d364869e16bae)
