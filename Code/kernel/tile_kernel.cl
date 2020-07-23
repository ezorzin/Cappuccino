/// @file     tile_kernel.cl
/// @author   Erik ZORZIN
/// @date     23JUL2020
/// @brief    Does nothing.
/// @details  The nothing:
/// @f$ alpha_0 @f$

__kernel void thekernel (
        __global float4*    tile_point,                                                             ///< Tile point coordinates.
        __global float4*    tile_color,                                                             ///< Tile color coordinates.
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
        float4 C;                                                                                   // Tile color coordinates.
        float t;                                                                                    // Time [s].

        P = tile_point[gid];                                                                        // Getting tile point...
        C = tile_color[gid];                                                                        // Getting tile color...

        t = time[gid];                                                                              // Getting simulation time...

        P.z = 0.0f;                                                                                 // Computing "z" point coordinate...
        t += 0.1f;                                                                                  // Incrementing simulation time...

        tile_point[gid] = P;                                                                        // Setting tile point...
        tile_color[gid] = C;                                                                        // Setting tile color...

        time[gid] = t;                                                                              // Setting simulation time...
}
