/// @file   voxel.vert
/// @author Erik ZORZIN
/// @date   25JUL2020
/// @brief  This vertex file creates a voxel with 3 bars out of a 4D point coordinates.

#version 410 core

const vec3 A1 = vec3(-1.0000, -1.0000, -1.0000);                                                    ///< @brief **Vertex "A1".**
const vec3 B1 = vec3(-1.0000, -1.0000, +1.0000);                                                    ///< @brief **Vertex "B1".**
const vec3 C1 = vec3(-1.0000, +1.0000, -1.0000);                                                    ///< @brief **Vertex "C1".**
const vec3 D1 = vec3(-1.0000, +1.0000, +1.0000);                                                    ///< @brief **Vertex "D1".**
const vec3 E1 = vec3(-0.3333, -1.0000, -1.0000);                                                    ///< @brief **Vertex "E1".**
const vec3 F1 = vec3(-0.3333, -1.0000, +1.0000);                                                    ///< @brief **Vertex "F1".**
const vec3 G1 = vec3(-0.3333, +1.0000, -1.0000);                                                    ///< @brief **Vertex "G1".**
const vec3 H1 = vec3(-0.3333, +1.0000, +1.0000);                                                    ///< @brief **Vertex "H1".**

const vec3 A2 = vec3(-0.3333, -1.0000, -1.0000);                                                    ///< @brief **Vertex "A2".**
const vec3 B2 = vec3(-0.3333, -1.0000, +1.0000);                                                    ///< @brief **Vertex "B2".**
const vec3 C2 = vec3(-0.3333, +1.0000, -1.0000);                                                    ///< @brief **Vertex "C2".**
const vec3 D2 = vec3(-0.3333, +1.0000, +1.0000);                                                    ///< @brief **Vertex "D2".**
const vec3 E2 = vec3(+0.3333, -1.0000, -1.0000);                                                    ///< @brief **Vertex "E2".**
const vec3 F2 = vec3(+0.3333, -1.0000, +1.0000);                                                    ///< @brief **Vertex "F2".**
const vec3 G2 = vec3(+0.3333, +1.0000, -1.0000);                                                    ///< @brief **Vertex "G2".**
const vec3 H2 = vec3(+0.3333, +1.0000, +1.0000);                                                    ///< @brief **Vertex "H2".**

const vec3 A3 = vec3(+0.3333, -1.0000, -1.0000);                                                    ///< @brief **Vertex "A3".**
const vec3 B3 = vec3(+0.3333, -1.0000, +1.0000);                                                    ///< @brief **Vertex "B3".**
const vec3 C3 = vec3(+0.3333, +1.0000, -1.0000);                                                    ///< @brief **Vertex "C3".**
const vec3 D3 = vec3(+0.3333, +1.0000, +1.0000);                                                    ///< @brief **Vertex "D3".**
const vec3 E3 = vec3(+1.0000, -1.0000, -1.0000);                                                    ///< @brief **Vertex "E3".**
const vec3 F3 = vec3(+1.0000, -1.0000, +1.0000);                                                    ///< @brief **Vertex "F3".**
const vec3 G3 = vec3(+1.0000, +1.0000, -1.0000);                                                    ///< @brief **Vertex "G3".**
const vec3 H3 = vec3(+1.0000, +1.0000, +1.0000);                                                    ///< @brief **Vertex "H3".**

const vec3 nL = vec3(-1.0, +0.0, +0.0);                                                             ///< @brief **Normal "LEFT".**
const vec3 nR = vec3(+1.0, +0.0, +0.0);                                                             ///< @brief **Normal "RIGHT".**
const vec3 nD = vec3(+0.0, -1.0, +0.0);                                                             ///< @brief **Normal "DOWN".**
const vec3 nU = vec3(+0.0, +1.0, +0.0);                                                             ///< @brief **Normal "UP".**
const vec3 nB = vec3(+0.0, +0.0, -1.0);                                                             ///< @brief **Normal "BACK".**
const vec3 nF = vec3(+0.0, +0.0, +1.0);                                                             ///< @brief **Normal "FRONT".**

const float s = 0.008;                                                                              ///< @brief **Voxel side.**
const vec3 l = vec3(0.0, -1.0, 0.0);                                                                ///< @brief **Light direction.**

layout (location = 0) in vec4   voxel_center;                                                       ///< @brief **Voxel center.**
layout (location = 1) in vec4   voxel_color_1;                                                      ///< @brief **Voxel color_1.**
layout (location = 2) in vec4   voxel_color_2;                                                      ///< @brief **Voxel color_2.**
layout (location = 3) in vec4   voxel_color_3;                                                      ///< @brief **Voxel color_3.**
layout (location = 4) in float  voxel_height_1;                                                     ///< @brief **Voxel height_1.**
layout (location = 5) in float  voxel_height_2;                                                     ///< @brief **Voxel height_2.**
layout (location = 6) in float  voxel_height_3;                                                     ///< @brief **Voxel height_3.**

out VS_OUT
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
} vs_out;

uniform mat4 V_mat;                                                                                 ///< View matrix.
uniform mat4 P_mat;                                                                                 ///< Projection matrix.

/// @function main
/// Computing rendering point coordinates:
void main(void)
{
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////// VOXEL: 3D binary hypercube ////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //       (-1.0, +1.0, -1.0)    C--------G  (+1.0, +1.0, -1.0)
  //                            /|       /|
  //       (-1.0, +1.0, +1.0)  D--------H |  (+1.0, +1.0, +1.0)
  //       (-1.0, -1.0, -1.0)  | A------|-E  (+1.0, -1.0, -1.0)
  //                           |/       |/
  //       (-1.0, -1.0, +1.0)  B--------F    (+1.0, -1.0, +1.0)
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

  vec3 normal_L;                                                                                    // LEFT:  face "ABDC" normal.
  vec3 normal_R;                                                                                    // RIGHT: face "EFGH" normal.
  vec3 normal_D;                                                                                    // DOWN:  face "ABFE" normal.
  vec3 normal_U;                                                                                    // UP:    face "CDHG" normal.
  vec3 normal_B;                                                                                    // BACK:  face "AEGC" normal.
  vec3 normal_F;                                                                                    // FRONT: face "BFHD" normal.

  float diffusion_L;                                                                                // LEFT:  face "ABDC" diffusion coefficient.
  float diffusion_R;                                                                                // RIGHT: face "EFGH" diffusion coefficient.
  float diffusion_D;                                                                                // DOWN:  face "ABFE" diffusion coefficient.
  float diffusion_U;                                                                                // UP:    face "CDHG" diffusion coefficient.
  float diffusion_B;                                                                                // BACK:  face "AEGC" diffusion coefficient.
  float diffusion_F;                                                                                // FRONT: face "BFHD" diffusion coefficient.

  vec3 height;

  gl_Position = P_mat*V_mat*voxel_center;                                                           // Setting voxel position...
  light = -normalize(l);                                                                            // Normalizing and inverting light direction...
  height = vec3(0.0, 0.0, voxel_height);                                                            // Computing height offset vector...

  ////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////// VOXEL'S FACE BARICENTRIC NORMALS //////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  normal_L = vec3(P_mat*V_mat*(voxel_center + vec4(nL, +1.0)));                                     // LEFT:  computing face "ABDC" normal...
  normal_R = vec3(P_mat*V_mat*(voxel_center + vec4(nR, +1.0)));                                     // RIGHT: fcomputing face "EFHG" normal...
  normal_D = vec3(P_mat*V_mat*(voxel_center + vec4(nD, +1.0)));                                     // DOWN:  computing face "ABFE" normal...
  normal_U = vec3(P_mat*V_mat*(voxel_center + vec4(nU, +1.0)));                                     // UP:    computing face "CDHG" normal...
  normal_B = vec3(P_mat*V_mat*(voxel_center + vec4(nB, +1.0)));                                     // BACK:  computing face "AEGC" normal...
  normal_F = vec3(P_mat*V_mat*(voxel_center + vec4(nF, +1.0)));                                     // FRONT: computing face "BFHD" normal...

  ////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////// VOXEL'S FACE DIFFUSION COEFFICIENTS ///////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  diffusion_L = clamp(dot(light, normal_L), 0.2, 1.0);                                              // LEFT:  computing face "ABDC" diffusion coefficient...
  diffusion_R = clamp(dot(light, normal_R), 0.2, 1.0);                                              // RIGHT: computing face "EFGH" diffusion coefficient...
  diffusion_D = clamp(dot(light, normal_D), 0.2, 1.0);                                              // DOWN:  computing face "ABFE" diffusion coefficient...
  diffusion_U = clamp(dot(light, normal_U), 0.2, 1.0);                                              // UP:    computing face "CDHG" diffusion coefficient...
  diffusion_B = clamp(dot(light, normal_B), 0.2, 1.0);                                              // BACK:  computing face "AEGC" diffusion coefficient...
  diffusion_F = clamp(dot(light, normal_F), 0.2, 1.0);                                              // FRONT: computing face "BFHD" diffusion coefficient...

  ////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////// VOXEL'S NU_VERTEX BARICENTRIC COORDINATES ////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  vs_out.vertex_A1 = P_mat*V_mat*(voxel_center + vec4(s*A1, 1.0));                                  // Computing vertex "A1"...
  vs_out.vertex_B1 = P_mat*V_mat*(voxel_center + vec4(s*(B1+ height), 1.0));                        // Computing vertex "B1"...
  vs_out.vertex_C1 = P_mat*V_mat*(voxel_center + vec4(s*C1, 1.0));                                  // Computing vertex "C1"...
  vs_out.vertex_D1 = P_mat*V_mat*(voxel_center + vec4(s*(D1 + height), 1.0));                       // Computing vertex "D1"...
  vs_out.vertex_E1 = P_mat*V_mat*(voxel_center + vec4(s*E1, 1.0));                                  // Computing vertex "E1"...
  vs_out.vertex_F1 = P_mat*V_mat*(voxel_center + vec4(s*(F1 + height), 1.0));                       // Computing vertex "F1"...
  vs_out.vertex_G1 = P_mat*V_mat*(voxel_center + vec4(s*G1, 1.0));                                  // Computing vertex "G1"...
  vs_out.vertex_H1 = P_mat*V_mat*(voxel_center + vec4(s*(H1 + height), 1.0));                       // Computing vertex "H1"...

  vs_out.vertex_A2 = P_mat*V_mat*(voxel_center + vec4(s*A2, 1.0));                                  // Computing vertex "A2"...
  vs_out.vertex_B2 = P_mat*V_mat*(voxel_center + vec4(s*(B2+ height), 1.0));                        // Computing vertex "B2"...
  vs_out.vertex_C2 = P_mat*V_mat*(voxel_center + vec4(s*C2, 1.0));                                  // Computing vertex "C2"...
  vs_out.vertex_D2 = P_mat*V_mat*(voxel_center + vec4(s*(D2 + height), 1.0));                       // Computing vertex "D2"...
  vs_out.vertex_E2 = P_mat*V_mat*(voxel_center + vec4(s*E2, 1.0));                                  // Computing vertex "E2"...
  vs_out.vertex_F2 = P_mat*V_mat*(voxel_center + vec4(s*(F2 + height), 1.0));                       // Computing vertex "F2"...
  vs_out.vertex_G2 = P_mat*V_mat*(voxel_center + vec4(s*G2, 1.0));                                  // Computing vertex "G2"...
  vs_out.vertex_H2 = P_mat*V_mat*(voxel_center + vec4(s*(H2 + height), 1.0));                       // Computing vertex "H2"...

  vs_out.vertex_A2 = P_mat*V_mat*(voxel_center + vec4(s*A2, 1.0));                                  // Computing vertex "A3"...
  vs_out.vertex_B2 = P_mat*V_mat*(voxel_center + vec4(s*(B2+ height), 1.0));                        // Computing vertex "B3"...
  vs_out.vertex_C2 = P_mat*V_mat*(voxel_center + vec4(s*C2, 1.0));                                  // Computing vertex "C3"...
  vs_out.vertex_D2 = P_mat*V_mat*(voxel_center + vec4(s*(D2 + height), 1.0));                       // Computing vertex "D3"...
  vs_out.vertex_E2 = P_mat*V_mat*(voxel_center + vec4(s*E2, 1.0));                                  // Computing vertex "E3"...
  vs_out.vertex_F2 = P_mat*V_mat*(voxel_center + vec4(s*(F2 + height), 1.0));                       // Computing vertex "F3"...
  vs_out.vertex_G2 = P_mat*V_mat*(voxel_center + vec4(s*G2, 1.0));                                  // Computing vertex "G3"...
  vs_out.vertex_H2 = P_mat*V_mat*(voxel_center + vec4(s*(H2 + height), 1.0));                       // Computing vertex "H3"...

  ////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////// VOXEL'S FACE COLORS //////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  vs_out.color_L1 = vec4(diffusion_L*vec3(voxel_color_1), 1.0);                                     // LEFT:  computing face "ABDC" color_1...
  vs_out.color_R1 = vec4(diffusion_R*vec3(voxel_color_1), 1.0);                                     // RIGHT: computing face "EFHG" color_1...
  vs_out.color_D1 = vec4(diffusion_D*vec3(voxel_color_1), 1.0);                                     // DOWN:  computing face "ABFE" color_1...
  vs_out.color_U1 = vec4(diffusion_U*vec3(voxel_color_1), 1.0);                                     // UP:    computing face "CDHG" color_1...
  vs_out.color_B1 = vec4(diffusion_B*vec3(voxel_color_1), 1.0);                                     // BACK:  computing face "AEGC" color_1...
  vs_out.color_F1 = vec4(diffusion_F*vec3(voxel_color_1), 1.0);                                     // FRONT: computing face "BFHD" color_1...

  vs_out.color_L2 = vec4(diffusion_L*vec3(voxel_color_2), 1.0);                                     // LEFT:  computing face "ABDC" color_2...
  vs_out.color_R2 = vec4(diffusion_R*vec3(voxel_color_2), 1.0);                                     // RIGHT: computing face "EFHG" color_2...
  vs_out.color_D2 = vec4(diffusion_D*vec3(voxel_color_2), 1.0);                                     // DOWN:  computing face "ABFE" color_2...
  vs_out.color_U2 = vec4(diffusion_U*vec3(voxel_color_2), 1.0);                                     // UP:    computing face "CDHG" color_2...
  vs_out.color_B2 = vec4(diffusion_B*vec3(voxel_color_2), 1.0);                                     // BACK:  computing face "AEGC" color_2...
  vs_out.color_F2 = vec4(diffusion_F*vec3(voxel_color_2), 1.0);                                     // FRONT: computing face "BFHD" color_2...

  vs_out.color_L3 = vec4(diffusion_L*vec3(voxel_color_3), 1.0);                                     // LEFT:  computing face "ABDC" color_3...
  vs_out.color_R3 = vec4(diffusion_R*vec3(voxel_color_3), 1.0);                                     // RIGHT: computing face "EFHG" color_3...
  vs_out.color_D3 = vec4(diffusion_D*vec3(voxel_color_3), 1.0);                                     // DOWN:  computing face "ABFE" color_3...
  vs_out.color_U3 = vec4(diffusion_U*vec3(voxel_color_3), 1.0);                                     // UP:    computing face "CDHG" color_3...
  vs_out.color_B3 = vec4(diffusion_B*vec3(voxel_color_3), 1.0);                                     // BACK:  computing face "AEGC" color_3...
  vs_out.color_F3 = vec4(diffusion_F*vec3(voxel_color_3), 1.0);                                     // FRONT: computing face "BFHD" color_3...
}
