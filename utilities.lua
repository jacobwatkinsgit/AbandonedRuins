local base_util = require("__core__/lualib/util")

local util = {}
util.SMALL_RUIN_HALF_SIZE = 8 / 2
util.MEDIUM_RUIN_HALF_SIZE = 16 / 2
util.LARGE_RUIN_HALF_SIZE = 32 / 2
util.debugprint = __DebugAdapter and __DebugAdapter.print or function() end

util.get_center_of_chunk = function(chunk_position)
  return {x = chunk_position.x * 32 + 16, y = chunk_position.y * 32 + 16}
end

util.area_from_center_and_half_size = function(half_size, center)
  return {{center.x - half_size, center.y - half_size}, {center.x + half_size, center.y + half_size}}
end

util.safe_insert = base_util.insert_safe -- (entity, item_dict: {name = count})

util.safe_damage = function(entity, damage)
  if not entity then return end
  entity.damage(damage.dmg, damage.force or "neutral", damage.type or "physical")
end

return util
