/// @file     cappuccino_kernel.cl
/// @author   Erik ZORZIN
/// @date     22JUL2020
/// @brief    Does nothing.
/// @details  The nothing:
/// @f$ alpha_0 @f$

__kernel void thekernel (
        __global float4*    voxel_point,                                                            ///< Voxel point coordinates.
        __global float4*    voxel_color,                                                            ///< Voxel color coordinates.
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
        float4 P;                                                                                   // Voxel point coordinates.
        float4 C;                                                                                   // Voxel color coordinates.
        float t;                                                                                    // Time [s].

        P = voxel_point[gid];                                                                       // Getting voxel point...
        C = voxel_color[gid];                                                                       // Getting voxel color...

        t = time[gid];                                                                              // Getting simulation time...

        P.z = 0.0f;                                                                                 // Computing "z" point coordinate...
        t += 0.1f;                                                                                  // Incrementing simulation time...

        voxel_point[gid] = P;                                                                       // Setting voxel point...
        voxel_color[gid] = C;                                                                       // Setting voxel color...

        time[gid] = t;                                                                              // Setting simulation time...
}
