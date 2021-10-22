# ------------------------------------------------------------------------
# Copyright 2019, 2020, 2021 The Aerospace Corporation
#
# This file is part of SatCat5.
#
# SatCat5 is free software: you can redistribute it and/or modify it under
# the terms of the GNU Lesser General Public License as published by the
# Free Software Foundation, either version 3 of the License, or (at your
# option) any later version.
#
# SatCat5 is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
# License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with SatCat5.  If not, see <https://www.gnu.org/licenses/>.
# ------------------------------------------------------------------------
#
# This script creates a new Vivado project for the Prototype V1 target
# (AC701 + custom I/O board) in the "base" (RMII) configuration.
# To re-create the project, source this file in the Vivado Tcl Shell.
#

# Change to example project folder.
cd [file normalize [file dirname [info script]]]

# Set project-level properties.
set target_part "xc7a200tfbg676-2"
set target_proj "switch_proto_v1_base"
set target_top "switch_top_ac701_base"
set constr_synth "switch_proto_v1_base_synth.xdc"
set constr_impl "switch_proto_v1_base_impl.xdc"

# List HDL source files, grouped by type.
set files_main [list \
 "[file normalize "../../src/vhdl/common/common_functions.vhd"]"\
 "[file normalize "../../src/vhdl/common/common_primitives.vhd"]"\
 "[file normalize "../../src/vhdl/common/cfgbus_common.vhd"]"\
 "[file normalize "../../src/vhdl/common/cfgbus_host_eth.vhd"]"\
 "[file normalize "../../src/vhdl/common/cfgbus_host_uart.vhd"]"\
 "[file normalize "../../src/vhdl/common/cfgbus_mdio.vhd"]"\
 "[file normalize "../../src/vhdl/common/config_peripherals.vhd"]"\
 "[file normalize "../../src/vhdl/common/eth_frame_adjust.vhd"]"\
 "[file normalize "../../src/vhdl/common/eth_frame_check.vhd"]"\
 "[file normalize "../../src/vhdl/common/eth_frame_common.vhd"]"\
 "[file normalize "../../src/vhdl/common/eth_pause_ctrl.vhd"]"\
 "[file normalize "../../src/vhdl/common/eth_preamble_rx.vhd"]"\
 "[file normalize "../../src/vhdl/common/eth_preamble_tx.vhd"]"\
 "[file normalize "../../src/vhdl/common/fifo_packet.vhd"]"\
 "[file normalize "../../src/vhdl/common/fifo_priority.vhd"]"\
 "[file normalize "../../src/vhdl/common/fifo_smol_async.vhd"]"\
 "[file normalize "../../src/vhdl/common/fifo_smol_resize.vhd"]"\
 "[file normalize "../../src/vhdl/common/fifo_smol_sync.vhd"]"\
 "[file normalize "../../src/vhdl/common/io_clock_detect.vhd"]"\
 "[file normalize "../../src/vhdl/common/io_error_reporting.vhd"]"\
 "[file normalize "../../src/vhdl/common/io_leds.vhd"]"\
 "[file normalize "../../src/vhdl/common/io_mdio_readwrite.vhd"]"\
 "[file normalize "../../src/vhdl/common/io_spi_controller.vhd"]"\
 "[file normalize "../../src/vhdl/common/io_spi_peripheral.vhd"]"\
 "[file normalize "../../src/vhdl/common/io_uart.vhd"]"\
 "[file normalize "../../src/vhdl/common/mac_core.vhd"]"\
 "[file normalize "../../src/vhdl/common/mac_counter.vhd"]"\
 "[file normalize "../../src/vhdl/common/mac_igmp_simple.vhd"]"\
 "[file normalize "../../src/vhdl/common/mac_lookup.vhd"]"\
 "[file normalize "../../src/vhdl/common/mac_priority.vhd"]"\
 "[file normalize "../../src/vhdl/common/packet_delay.vhd"]"\
 "[file normalize "../../src/vhdl/common/packet_inject.vhd"]"\
 "[file normalize "../../src/vhdl/common/packet_round_robin.vhd"]"\
 "[file normalize "../../src/vhdl/common/port_adapter.vhd"]"\
 "[file normalize "../../src/vhdl/common/port_rmii.vhd"]"\
 "[file normalize "../../src/vhdl/common/port_serial_auto.vhd"]"\
 "[file normalize "../../src/vhdl/common/slip_decoder.vhd"]"\
 "[file normalize "../../src/vhdl/common/slip_encoder.vhd"]"\
 "[file normalize "../../src/vhdl/common/switch_aux.vhd"]"\
 "[file normalize "../../src/vhdl/common/switch_core.vhd"]"\
 "[file normalize "../../src/vhdl/common/switch_types.vhd"]"\
 "[file normalize "../../src/vhdl/common/tcam_cache_nru2.vhd"]"\
 "[file normalize "../../src/vhdl/common/tcam_cache_plru.vhd"]"\
 "[file normalize "../../src/vhdl/common/tcam_core.vhd"]"\
 "[file normalize "../../src/vhdl/common/tcam_maxlen.vhd"]"\
 "[file normalize "../../src/vhdl/common/tcam_table.vhd"]"\
 "[file normalize "../../src/vhdl/xilinx/7series_io.vhd"]"\
 "[file normalize "../../src/vhdl/xilinx/7series_mem.vhd"]"\
 "[file normalize "../../src/vhdl/xilinx/7series_sync.vhd"]"\
 "[file normalize "../../src/vhdl/xilinx/lcd_control.vhd"]"\
 "[file normalize "../../src/vhdl/xilinx/scrub_xilinx.vhd"]"\
 "[file normalize "./switch_top_ac701_base.vhd"]"\
]

# Run the main script.
source ../../project/vivado/shared_create.tcl