/// @file   tile_3.geom
/// @author Erik ZORZIN
/// @date   25JUL2020
/// @brief  This geometry file creates a tile with 3 bars out of a 4D point coordinates.

#version 410 core

#define ONE_THIRD 0.3333f

layout (points) in;                                                                                 ///< @brief **Input points.**
layout (triangle_strip, max_vertices = 26) out;                                                     ///< @brief **Output points.**

in VS_OUT
{
  vec4 vertex_A;                                                                                    ///< Vertex "A".
  vec4 vertex_B;                                                                                    ///< Vertex "B".
  vec4 vertex_C;                                                                                    ///< Vertex "C".
  vec4 vertex_D;                                                                                    ///< Vertex "D".
  vec4 color_1_front;                                                                               ///< Face "ABDC" front color_1.
  vec4 color_2_front;                                                                               ///< Face "ABDC" front color_2.
  vec4 color_3_front;                                                                               ///< Face "ABDC" front color_3.
  vec4 color_1_back;                                                                                ///< Face "ABDC" back color_1.
  vec4 color_2_back;                                                                                ///< Face "ABDC" back color_2.
  vec4 color_3_back;                                                                                ///< Face "ABDC" back color_3.
  float L;                                                                                          ///< Face "ABCD" side length.
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

  float ONE_THIRD = 0.3333*gs_in.L;
  float TWO_THIRD = 0.6666*gs_in.L;
  float THREE_THIRD = 0.9999*gs_in.L;

  //////////////////////////////////////////////// ABC ///////////////////////////////////////////////
  tile_color = gs_in[0].color_1_front;                                                              // Setting tile color...
  gl_Position = gs_in[0].vertex_A;                                                                  // Setting tile position...
  EmitVertex();                                                                                     // "A" vertex.

  tile_color = gs_in[0].color_1_front;                                                              // Setting tile color...
  gl_Position = gs_in[0].vertex_B - vec4(ONE_THIRD, 0.0, 0.0, 1.0);                                   // Setting tile position...
  EmitVertex();                                                                                     // "B" vertex.

  tile_color = gs_in[0].color_front;                                                                // Setting tile color...
  gl_Position = gs_in[0].vertex_C;                                                                  // Setting tile position...
  EmitVertex();                                                                                     // "C" vertex.

  tile_color = gs_in[0].color_front;                                                                // Setting tile color...
  gl_Position = gs_in[0].vertex_D*vec4(ONE_THIRD, 1.0, 1.0, 1.0);                                   // Setting tile position...
  EmitVertex();                                                                                     // "D" vertex.

  EndPrimitive();

  tile_color = gs_in[0].color_back;                                                                 // Setting tile color...
  gl_Position = gs_in[0].vertex_A;                                                                  // Setting tile position...
  EmitVertex();                                                                                     // "A" vertex.

  tile_color = gs_in[0].color_back;                                                                 // Setting tile color...
  gl_Position = gs_in[0].vertex_C;                                                                  // Setting tile position...
  EmitVertex();                                                                                     // "C" vertex.

  tile_color = gs_in[0].color_back;                                                                 // Setting tile color...
  gl_Position = gs_in[0].vertex_B;                                                                  // Setting tile position...
  EmitVertex();                                                                                     // "B" vertex.

  tile_color = gs_in[0].color_back;                                                                 // Setting tile color...
  gl_Position = gs_in[0].vertex_D;                                                                  // Setting tile position...
  EmitVertex();                                                                                     // "D" vertex.

  EndPrimitive();
}
