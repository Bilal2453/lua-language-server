TEST [[
---@class <!A!>
---@class B : <?A?>
]]

TEST [[
---@class <!A!>
---@type B|<?A?>
]]

TEST [[
---@class Class
local <?<!t!>?>
---@type Class
local x
]]

TEST [[
---@class Class
local <!t!>
---@type Class
local <?<!x!>?>
]]

TEST [[
---@class A
local mt = {}
function mt:<!cast!>()
end

---@type A
local obj
obj:<?cast?>()
]]

TEST [[
---@class A
local <!mt!> = {}
function mt:cast()
end

---@type A
local <!obj!>
<?obj?>:cast()
]]

TEST [[
---@type A
local <?<!obj!>?>

---@class A
local <!mt!>
]]

TEST [[
---@type A
local obj
obj:<?func?>()

---@class A
local mt
function mt:<!func!>()
end
]]

TEST [[
---@type A
local obj
obj:<?func?>()

local mt = {}
mt.__index = mt
function mt:<!func!>()
end
---@class A
local obj = setmetatable({}, mt)
]]

TEST [[
---@alias <!B!> A
---@type <?B?>
]]

TEST [[
---@class <!Class!>
---@param a <?Class?>
]]

TEST [[
---@param f <!fun():void!>
function t(<?<!f!>?>) end
]]

TEST [[
---@overload fun(y: boolean)
---@param x number
---@param y boolean
---@param z string
function <!f!>(x, y, z) end

print(<?f?>)
]]

TEST [[
local function f()
    return 1
end

---@class Class
local <!mt!>

---@type Class
local <?<!x!>?> = f()
]]

TEST [[
---@class Class
---@field <!name!> string
---@field id integer
local mt = {}
mt.<?name?>
]]

TEST [[
---@alias <!A!> string

---@type <?A?>
]]

TEST [[
---@class X
---@field <!a!> string

---@class Y:X

---@type Y
local y
y.<?a?>
]]

TEST [[
---@class <!loli!>
local <!unit!>

function unit:pants()
end

---@see <?loli?>
]]

TEST [[
---@class loli
local unit

function unit:<!pants!>()
end

---@see loli#<?pants?>
]]

TEST [[
---@class AAAA
---@field a AAAA
AAAA = {};

function AAAA:<!SSDF!>()
    
end

AAAA.a.<?SSDF?>
]]

TEST [[
---@class Cat
local <!m!> ---hahaha
---@class Dog
local 	m2
---@type Cat
local <?<!v!>?>
]]

TEST [[
---@class Cat
local <!m!> --hahaha
---@class Dog
local 	m2
---@type Cat
local <?<!v!>?>
]]

TEST [[
---@class Cat
 local <!m!> ---hahaha

  ---@class Dog
   local 	m2
	 ---@type Cat
	 	 local <?<!v!>?>
]]

TEST [[
---@class Foo
local Foo = {}
function Foo:<!bar1!>() end

---@generic T
---@param arg1 T
---@return T
function Generic(arg1) print(arg1) end

local v1 = Generic(Foo)
print(v1.<?bar1?>)
]]

TEST [[
---@class Foo
local Foo = {}
function Foo:bar1() end

---@generic T
---@param arg1 T
---@return T
function Generic(arg1) print(arg1) end

local v1 = Generic("Foo")
print(v1.<?bar1?>)
]]

TEST [[
---@class Foo
local Foo = {}
function Foo:bar1() end

---@generic T
---@param arg1 `T`
---@return T
function Generic(arg1) print(arg1) end

local v1 = Generic(Foo)
print(v1.<?bar1?>)
]]

TEST [[
---@class Foo
local Foo = {}
function Foo:<!bar1!>() end

---@generic T
---@param arg1 `T`
---@return T
function Generic(arg1) print(arg1) end

local v1 = Generic("Foo")
print(v1.<?bar1?>)
]]
