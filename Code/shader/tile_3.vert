/// @file   tile_3.vert
/// @author Erik ZORZIN
/// @date   25JUL2020
/// @brief  This vertex file creates a tile with 3 bars out of a 4D point coordinates.

#version 410 core

const vec3 A1 = vec3(-1.0000, -1.0000, +0.0000);                                                    ///< @brief **Vertex "A".**
const vec3 B1 = vec3(-0.3333, -1.0000, +0.0000);                                                    ///< @brief **Vertex "B".**
const vec3 C1 = vec3(-1.0000, +1.0000, +0.0000);                                                    ///< @brief **Vertex "C".**
const vec3 D1 = vec3(-0.3333, +1.0000, +0.0000);                                                    ///< @brief **Vertex "D".**
const vec3 A2 = vec3(-0.3333, -1.0000, +0.0000);                                                    ///< @brief **Vertex "A".**
const vec3 B2 = vec3(+0.3333, -1.0000, +0.0000);                                                    ///< @brief **Vertex "B".**
const vec3 C2 = vec3(-0.3333, +1.0000, +0.0000);                                                    ///< @brief **Vertex "C".**
const vec3 D2 = vec3(+0.3333, +1.0000, +0.0000);                                                    ///< @brief **Vertex "D".**
const vec3 A3 = vec3(+0.3333, -1.0000, +0.0000);                                                    ///< @brief **Vertex "A".**
const vec3 B3 = vec3(+1.0000, -1.0000, +0.0000);                                                    ///< @brief **Vertex "B".**
const vec3 C3 = vec3(+0.3333, +1.0000, +0.0000);                                                    ///< @brief **Vertex "C".**
const vec3 D3 = vec3(+1.0000, +1.0000, +0.0000);                                                    ///< @brief **Vertex "D".**
const vec3 n = vec3(+0.0, +0.0, +1.0);                                                              ///< @brief **Face normal.**
const float s = 0.008;                                                                              ///< @brief **Tile side.**
const vec3 l = vec3(0.0, -1.0, 0.0);                                                                ///< @brief **Light direction.**

layout (location = 0) in vec4   tile_center;                                                        ///< @brief **Tile center.**
layout (location = 1) in vec4   tile_color_1;                                                       ///< @brief **Tile color_1.**
layout (location = 2) in vec4   tile_color_2;                                                       ///< @brief **Tile color_2.**
layout (location = 3) in vec4   tile_color_3;                                                       ///< @brief **Tile color_3.**

out VS_OUT
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
} vs_out;

uniform mat4 V_mat;                                                                                 ///< View matrix.
uniform mat4 P_mat;                                                                                 ///< Projection matrix.

/// @function main
/// Computing rendering point coordinates:
void main(void)
{
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////// TILE: 2D binary square //////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //       (-1.0, +1.0, +0.0)  C--------D  (+1.0, +1.0, +0.0)
  //                           |        |
  //                           |        |
  //       (-1.0, -1.0, +0.0)  A--------B  (+1.0, -1.0, +0.0)
  //
  //                               y (points up)
  //                               |
  //                               o -- x (points right)
  //                              /
  //                             z (points out of the screen)
  //
  //                               UP
  //                               |  / BACK
  //                               | /
  //                     LEFT -----+----- RIGHT
  //                              /|
  //                       FRONT / |
  //                              DOWN
  //
  ////////////////////////////////////////////////////////////////////////////////////////////////////

  vec3 light;                                                                                       // Light direction.
  vec3 normal;                                                                                      // Face "ABDC" normal.
  float diffusion_front;                                                                            // Face "ABDC" front diffusion coefficient.
  float diffusion_back;                                                                             // Face "ABDC" back diffusion coefficient.

  gl_Position = P_mat*V_mat*tile_center;                                                            // Setting tile position...
  light = -normalize(l);                                                                            // Normalizing and inverting light direction...

  ////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////// TILE'S FACE BARICENTRIC NORMALS ///////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  normal = vec3(P_mat*V_mat*(tile_center + vec4(n, +1.0)));                                         // Computing face "ABDC" normal...
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////// TILE'S FACE DIFFUSION COEFFICIENTS ////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  diffusion_front = clamp(dot(light, normal), 0.3, 1.0);                                            // Computing face "ABDC" front diffusion coefficient...
  diffusion_back = clamp(dot(light, -normal), 0.3, 1.0);                                            // Computing face "ABDC" back diffusion coefficient...
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////// TILE'S NU_VERTEX BARICENTRIC COORDINATES /////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  vs_out.vertex_A1 = P_mat*V_mat*(tile_center + vec4(s*A1, 1.0));                                   // Computing vertex "A1"...
  vs_out.vertex_B1 = P_mat*V_mat*(tile_center + vec4(s*B1, 1.0));                                   // Computing vertex "B1"...
  vs_out.vertex_C1 = P_mat*V_mat*(tile_center + vec4(s*C1, 1.0));                                   // Computing vertex "C1"...
  vs_out.vertex_D1 = P_mat*V_mat*(tile_center + vec4(s*D1, 1.0));                                   // Computing vertex "D1"...
  vs_out.vertex_A2 = P_mat*V_mat*(tile_center + vec4(s*A2, 1.0));                                   // Computing vertex "A2"...
  vs_out.vertex_B2 = P_mat*V_mat*(tile_center + vec4(s*B2, 1.0));                                   // Computing vertex "B2"...
  vs_out.vertex_C2 = P_mat*V_mat*(tile_center + vec4(s*C2, 1.0));                                   // Computing vertex "C2"...
  vs_out.vertex_D2 = P_mat*V_mat*(tile_center + vec4(s*D2, 1.0));                                   // Computing vertex "D2"...
  vs_out.vertex_A3 = P_mat*V_mat*(tile_center + vec4(s*A3, 1.0));                                   // Computing vertex "A3"...
  vs_out.vertex_B3 = P_mat*V_mat*(tile_center + vec4(s*B3, 1.0));                                   // Computing vertex "B3"...
  vs_out.vertex_C3 = P_mat*V_mat*(tile_center + vec4(s*C3, 1.0));                                   // Computing vertex "C3"...
  vs_out.vertex_D3 = P_mat*V_mat*(tile_center + vec4(s*D3, 1.0));                                   // Computing vertex "D3"...

  ////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////// TILE'S FACE COLORS ///////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  vs_out.color_1_front = vec4(diffusion_front*vec3(tile_color_1), 1.0);                             // Computing face "ABDC" front color_1...
  vs_out.color_2_front = vec4(diffusion_front*vec3(tile_color_2), 1.0);                             // Computing face "ABDC" front color_2...
  vs_out.color_3_front = vec4(diffusion_front*vec3(tile_color_3), 1.0);                             // Computing face "ABDC" front color_3...
  vs_out.color_1_back = vec4(diffusion_back*vec3(tile_color_1), 1.0);                               // Computing face "ABDC" back color_1...
  vs_out.color_2_back = vec4(diffusion_back*vec3(tile_color_2), 1.0);                               // Computing face "ABDC" back color_2...
  vs_out.color_3_back = vec4(diffusion_back*vec3(tile_color_3), 1.0);                               // Computing face "ABDC" back color_3...
}
