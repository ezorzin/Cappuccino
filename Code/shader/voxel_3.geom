/// @file   voxel.geom
/// @author Erik ZORZIN
/// @date   25JUL2020
/// @brief  This geometry file creates a voxel with 3 bars out of a 4D point coordinates.

#version 410 core

layout (points) in;                                                                                 ///< @brief **Input points.**
layout (triangle_strip, max_vertices = 72) out;                                                     ///< @brief **Output points.**

in VS_OUT
{
  vec4 vertex_A1;                                                                                   ///< Vertex "A1".
  vec4 vertex_B1;                                                                                   ///< Vertex "B1".
  vec4 vertex_C1;                                                                                   ///< Vertex "C1".
  vec4 vertex_D1;                                                                                   ///< Vertex "D1".
  vec4 vertex_E1;                                                                                   ///< Vertex "E1".
  vec4 vertex_F1;                                                                                   ///< Vertex "F1".
  vec4 vertex_G1;                                                                                   ///< Vertex "G1".
  vec4 vertex_H1;                                                                                   ///< Vertex "H1".
  vec4 vertex_A2;                                                                                   ///< Vertex "A2".
  vec4 vertex_B2;                                                                                   ///< Vertex "B2".
  vec4 vertex_C2;                                                                                   ///< Vertex "C2".
  vec4 vertex_D2;                                                                                   ///< Vertex "D2".
  vec4 vertex_E2;                                                                                   ///< Vertex "E2".
  vec4 vertex_F2;                                                                                   ///< Vertex "F2".
  vec4 vertex_G2;                                                                                   ///< Vertex "G2".
  vec4 vertex_H2;                                                                                   ///< Vertex "H2".
  vec4 vertex_A3;                                                                                   ///< Vertex "A3".
  vec4 vertex_B3;                                                                                   ///< Vertex "B3".
  vec4 vertex_C3;                                                                                   ///< Vertex "C3".
  vec4 vertex_D3;                                                                                   ///< Vertex "D3".
  vec4 vertex_E3;                                                                                   ///< Vertex "E3".
  vec4 vertex_F3;                                                                                   ///< Vertex "F3".
  vec4 vertex_G3;                                                                                   ///< Vertex "G3".
  vec4 vertex_H3;                                                                                   ///< Vertex "H3".
  vec4 color_L1;                                                                                    ///< LEFT:  face "ABDC" color_1.
  vec4 color_R1;                                                                                    ///< RIGHT: face "EFHG" color_1.
  vec4 color_D1;                                                                                    ///< DOWN:  face "ABFE" color_1.
  vec4 color_U1;                                                                                    ///< UP:    face "CDHG" color_1.
  vec4 color_B1;                                                                                    ///< BACK:  face "AEGC" color_1.
  vec4 color_F1;                                                                                    ///< FRONT: face "BFHD" color_1.
  vec4 color_L2;                                                                                    ///< LEFT:  face "ABDC" color_2.
  vec4 color_R2;                                                                                    ///< RIGHT: face "EFHG" color_2.
  vec4 color_D2;                                                                                    ///< DOWN:  face "ABFE" color_2.
  vec4 color_U2;                                                                                    ///< UP:    face "CDHG" color_2.
  vec4 color_B2;                                                                                    ///< BACK:  face "AEGC" color_2.
  vec4 color_F2;                                                                                    ///< FRONT: face "BFHD" color_2.
  vec4 color_L3;                                                                                    ///< LEFT:  face "ABDC" color_3.
  vec4 color_R3;                                                                                    ///< RIGHT: face "EFHG" color_3.
  vec4 color_D3;                                                                                    ///< DOWN:  face "ABFE" color_3.
  vec4 color_U3;                                                                                    ///< UP:    face "CDHG" color_3.
  vec4 color_B3;                                                                                    ///< BACK:  face "AEGC" color_3.
  vec4 color_F3;                                                                                    ///< FRONT: face "BFHD" color_3.
} gs_in[];

out vec4 voxel_color;                                                                               ///< @brief **Voxel color (for fragment shader).**

/// @function main
/// Generating voxel verteces:
void main()
{
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////// VOXEL: triangulation scheme //////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //                             C--------G
  //                            /|       /|
  //                           D--------H |
  //                           | A------|-E
  //                           |/       |/
  //                           B--------F
  //
  //  Triangle strip sequence:
  //
  //             ABC +
  //                 | LEFT SIDE
  //           (BC)D +
  //                 
  //             EGF +
  //                 | RIGHT SIDE
  //           (GF)H +
  //
  //             AEB +
  //                 | BOTTOM SIDE
  //           (EB)F +
  //
  //             CGD +
  //                 | UP SIDE
  //           (GD)H +
  //
  //             ACE +
  //                 | BACK SIDE
  //           (CE)G +
  //
  //             BFD +
  //                 | FRONT SIDE
  //           (FD)H +
  ////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////// 1st bar ////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  // LEFT SIDE:
  tile_color = gs_in[0].color_L1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_A1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "A1" vertex.

  tile_color = gs_in[0].color_L1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_B1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "B1" vertex.

  tile_color = gs_in[0].color_L1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_C1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "C1" vertex.

  tile_color = gs_in[0].color_L1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_D1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "D1" vertex.

  EndPrimitive();

  // RIGHT SIDE:
  tile_color = gs_in[0].color_R1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_E1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "E1" vertex.

  tile_color = gs_in[0].color_R1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_G1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "G1" vertex.

  tile_color = gs_in[0].color_R1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_F1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "F1" vertex.

  tile_color = gs_in[0].color_R1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_H1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "H1" vertex.

  EndPrimitive();

  // DOWN SIDE:
  tile_color = gs_in[0].color_D1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_A1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "A1" vertex.

  tile_color = gs_in[0].color_D1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_E1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "E1" vertex.

  tile_color = gs_in[0].color_D1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_B1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "B1" vertex.

  tile_color = gs_in[0].color_D1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_F1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "F1" vertex.

  EndPrimitive();

  // UP SIDE:
  tile_color = gs_in[0].color_U1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_C1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "C1" vertex.

  tile_color = gs_in[0].color_U1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_G1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "G1" vertex.

  tile_color = gs_in[0].color_U1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_D1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "D1" vertex.

  tile_color = gs_in[0].color_U1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_H1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "H1" vertex.

  EndPrimitive();

  // BACK SIDE:
  tile_color = gs_in[0].color_B1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_A1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "A1" vertex.

  tile_color = gs_in[0].color_B1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_C1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "C1" vertex.

  tile_color = gs_in[0].color_B1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_E1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "E1" vertex.

  tile_color = gs_in[0].color_B1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_G1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "G1" vertex.

  EndPrimitive();

  // FRONT SIDE:
  tile_color = gs_in[0].color_F1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_B1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "B1" vertex.

  tile_color = gs_in[0].color_F1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_F1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "F1" vertex.

  tile_color = gs_in[0].color_F1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_D1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "D1" vertex.

  tile_color = gs_in[0].color_F1;                                                                   // Setting tile color...
  gl_Position = gs_in[0].vertex_H1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "H1" vertex.

  EndPrimitive();
}
