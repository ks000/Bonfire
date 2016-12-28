/*-------------------------------------------------------------------
-- TITLE: A memory class for Plasma MIPS simulator
-- AUTHOR: Karl Janson (karl.janson@ati.ttu.ee)
-- DATE CREATED: 04.12.16
-- FILENAME: memory.h
-- PROJECT: Project Bonfire
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--   Includes a generic definition for memory functions
--   Does not simulate a specific memory type
--   Can be used for RAM, register bank, or any other memory
--------------------------------------------------------------------*/

#ifndef __MEMORY_H__
#define __MEMORY_H__

#include "common.h"

enum class Mem_Type
{
    ram,
    reg_bank
};

class Memory
{

public:
    Memory(uint32_t memory_size, Mem_Type mem_type);
    ~Memory();

    void write(uint32_t address, uint32_t value);

    uint32_t read(uint32_t address);

    uint32_t get_size();
    Mem_Type get_type();

private:
    Mem_Type type;
    uint32_t *memory;
    uint32_t size;

};

#endif //__MEMORY_H__
