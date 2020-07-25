/// @file   tile_3.geom
/// @author Erik ZORZIN
/// @date   25JUL2020
/// @brief  This geometry file creates a tile with 3 bars out of a 4D point coordinates.

#version 410 core

layout (points) in;                                                                                 ///< @brief **Input points.**
layout (triangle_strip, max_vertices = 26) out;                                                     ///< @brief **Output points.**

in VS_OUT
{
  vec4 vertex_A1;                                                                                   ///< Vertex "A1".
  vec4 vertex_B1;                                                                                   ///< Vertex "B1".
  vec4 vertex_C1;                                                                                   ///< Vertex "C1".
  vec4 vertex_D1;                                                                                   ///< Vertex "D1".
  vec4 vertex_A2;                                                                                   ///< Vertex "A2".
  vec4 vertex_B2;                                                                                   ///< Vertex "B2".
  vec4 vertex_C2;                                                                                   ///< Vertex "C2".
  vec4 vertex_D2;                                                                                   ///< Vertex "D2".
  vec4 vertex_A3;                                                                                   ///< Vertex "A3".
  vec4 vertex_B3;                                                                                   ///< Vertex "B3".
  vec4 vertex_C3;                                                                                   ///< Vertex "C3".
  vec4 vertex_D3;                                                                                   ///< Vertex "D3".
  vec4 color_1_front;                                                                               ///< Face "ABDC" front color_1.
  vec4 color_2_front;                                                                               ///< Face "ABDC" front color_2.
  vec4 color_3_front;                                                                               ///< Face "ABDC" front color_3.
  vec4 color_1_back;                                                                                ///< Face "ABDC" back color_1.
  vec4 color_2_back;                                                                                ///< Face "ABDC" back color_2.
  vec4 color_3_back;                                                                                ///< Face "ABDC" back color_3.
} gs_in[];

out vec4 tile_color;                                                                                ///< @brief **Tile color (for fragment shader).**

/// @function main
/// Generating voxel verteces:
void main()
{
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////// VOXEL: triangulation scheme //////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //                           C--------D
  //                           |        |
  //                           |        |
  //                           A--------B
  //
  //  Triangle strip sequence:
  //
  //             ABC +
  //                 | 
  //           (BC)D +
  //
  //             ACB +
  //                 | 
  //           (CB)D +
  //
  ////////////////////////////////////////////////////////////////////////////////////////////////////

  /////////////////////////////////////////////// 1st bar ////////////////////////////////////////////
  tile_color = gs_in[0].color_1_front;                                                              // Setting tile color...
  gl_Position = gs_in[0].vertex_A1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "A1" vertex.

  tile_color = gs_in[0].color_1_front;                                                              // Setting tile color...
  gl_Position = gs_in[0].vertex_B1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "B1" vertex.

  tile_color = gs_in[0].color_1_front;                                                              // Setting tile color...
  gl_Position = gs_in[0].vertex_C1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "C1" vertex.

  tile_color = gs_in[0].color_1_front;                                                              // Setting tile color...
  gl_Position = gs_in[0].vertex_D1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "D1" vertex.

  EndPrimitive();

  tile_color = gs_in[0].color_1_back;                                                               // Setting tile color...
  gl_Position = gs_in[0].vertex_A1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "A1" vertex.

  tile_color = gs_in[0].color_1_back;                                                               // Setting tile color...
  gl_Position = gs_in[0].vertex_C1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "C1" vertex.

  tile_color = gs_in[0].color_1_back;                                                               // Setting tile color...
  gl_Position = gs_in[0].vertex_B1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "B1" vertex.

  tile_color = gs_in[0].color_1_back;                                                               // Setting tile color...
  gl_Position = gs_in[0].vertex_D1;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "D1" vertex.

  EndPrimitive();

  /////////////////////////////////////////////// 2nd bar ////////////////////////////////////////////
  tile_color = gs_in[0].color_2_front;                                                              // Setting tile color...
  gl_Position = gs_in[0].vertex_A2;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "A2" vertex.

  tile_color = gs_in[0].color_2_front;                                                              // Setting tile color...
  gl_Position = gs_in[0].vertex_B2;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "B2" vertex.

  tile_color = gs_in[0].color_2_front;                                                              // Setting tile color...
  gl_Position = gs_in[0].vertex_C2;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "C2" vertex.

  tile_color = gs_in[0].color_2_front;                                                              // Setting tile color...
  gl_Position = gs_in[0].vertex_D2;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "D2" vertex.

  EndPrimitive();

  tile_color = gs_in[0].color_2_back;                                                               // Setting tile color...
  gl_Position = gs_in[0].vertex_A2;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "A2" vertex.

  tile_color = gs_in[0].color_2_back;                                                               // Setting tile color...
  gl_Position = gs_in[0].vertex_C2;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "C2" vertex.

  tile_color = gs_in[0].color_2_back;                                                               // Setting tile color...
  gl_Position = gs_in[0].vertex_B2;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "B2" vertex.

  tile_color = gs_in[0].color_2_back;                                                               // Setting tile color...
  gl_Position = gs_in[0].vertex_D2;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "D2" vertex.

  EndPrimitive();

  /////////////////////////////////////////////// 3rd bar ////////////////////////////////////////////
  tile_color = gs_in[0].color_3_front;                                                              // Setting tile color...
  gl_Position = gs_in[0].vertex_A3;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "A3" vertex.

  tile_color = gs_in[0].color_3_front;                                                              // Setting tile color...
  gl_Position = gs_in[0].vertex_B3;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "B3" vertex.

  tile_color = gs_in[0].color_3_front;                                                              // Setting tile color...
  gl_Position = gs_in[0].vertex_C3;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "C3" vertex.

  tile_color = gs_in[0].color_3_front;                                                              // Setting tile color...
  gl_Position = gs_in[0].vertex_D3;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "D3" vertex.

  EndPrimitive();

  tile_color = gs_in[0].color_3_back;                                                               // Setting tile color...
  gl_Position = gs_in[0].vertex_A3;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "A3" vertex.

  tile_color = gs_in[0].color_3_back;                                                               // Setting tile color...
  gl_Position = gs_in[0].vertex_C3;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "C3" vertex.

  tile_color = gs_in[0].color_3_back;                                                               // Setting tile color...
  gl_Position = gs_in[0].vertex_B3;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "B3" vertex.

  tile_color = gs_in[0].color_3_back;                                                               // Setting tile color...
  gl_Position = gs_in[0].vertex_D3;                                                                 // Setting tile position...
  EmitVertex();                                                                                     // "D3" vertex.

  EndPrimitive();
}
