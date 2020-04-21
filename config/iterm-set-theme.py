#!/usr/bin/env python3.7

import iterm2

async def main(connection):
  profiles = await iterm2.PartialProfile.async_query(connection)
  ayuPreset = await iterm2.ColorPreset.async_get(connection, "ayu-dark")
  for profile in profiles:
    full = await profile.async_get_full_profile()
    await full.async_set_normal_font("SourceCodePro-Regular 14")
    await full.async_set_color_preset(ayuPreset)

iterm2.run_until_complete(main)
