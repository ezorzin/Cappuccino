/// @file     tile_kernel.cl
/// @author   Erik ZORZIN
/// @date     25JUL2020
/// @brief    Does nothing.
/// @details  The nothing:
/// @f$ alpha_0 @f$

__kernel void thekernel (
        __global float4*    tile_point,                                                             ///< Tile point coordinates.
        __global float4*    tile_color_1,                                                           ///< Tile color_1 coordinates.
        __global float4*    tile_color_2,                                                           ///< Tile color_2 coordinates.
        __global float4*    tile_color_3,                                                           ///< Tile color_3 coordinates.
        __global float*     time                                                                    ///< Time [s].
        )
{
        //////////////////////////////////////////////////////////////////////////////////////////////
        //////////////////////////////////////////// INDEXES /////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////////////////////////////
        unsigned int gid = get_global_id(0);                                                        // Global index "0".

        //////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////// NODES //////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////////////////////////////
        float4 P;                                                                                   // Tile point coordinates.
        float4 C1;                                                                                  // Tile color_1 coordinates.
        float4 C2;                                                                                  // Tile color_2 coordinates.
        float4 C3;                                                                                  // Tile color_3 coordinates.
        float t;                                                                                    // Time [s].

        P = tile_point[gid];                                                                        // Getting tile point...
        C1 = tile_color_1[gid];                                                                     // Getting tile color_1...
        C2 = tile_color_2[gid];                                                                     // Getting tile color_2...
        C3 = tile_color_3[gid];                                                                     // Getting tile color_3...

        t = time[gid];                                                                              // Getting simulation time...

        P.z = 0.0f;                                                                                 // Computing "z" point coordinate...
        t += 0.1f;                                                                                  // Incrementing simulation time...

        tile_point[gid] = P;                                                                        // Setting tile point...
        tile_color_1[gid] = C1;                                                                     // Setting tile color_1...
        tile_color_2[gid] = C2;                                                                     // Setting tile color_2...
        tile_color_3[gid] = C3;                                                                     // Setting tile color_3...

        time[gid] = t;                                                                              // Setting simulation time...
}
