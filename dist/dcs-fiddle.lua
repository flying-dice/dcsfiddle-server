--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]

local ____modules = {}
local ____moduleCache = {}
local ____originalRequire = require
local function require(file, ...)
    if ____moduleCache[file] then
        return ____moduleCache[file].value
    end
    if ____modules[file] then
        local module = ____modules[file]
        ____moduleCache[file] = { value = (select("#", ...) > 0) and module(...) or module(file) }
        return ____moduleCache[file].value
    else
        if ____originalRequire then
            return ____originalRequire(file)
        else
            error("module '" .. file .. "' not found")
        end
    end
end
____modules = {
["lualib_bundle"] = function(...) 
local function __TS__ArrayAt(self, relativeIndex)
    local absoluteIndex = relativeIndex < 0 and #self + relativeIndex or relativeIndex
    if absoluteIndex >= 0 and absoluteIndex < #self then
        return self[absoluteIndex + 1]
    end
    return nil
end

local function __TS__ArrayIsArray(value)
    return type(value) == "table" and (value[1] ~= nil or next(value) == nil)
end

local function __TS__ArrayConcat(self, ...)
    local items = {...}
    local result = {}
    local len = 0
    for i = 1, #self do
        len = len + 1
        result[len] = self[i]
    end
    for i = 1, #items do
        local item = items[i]
        if __TS__ArrayIsArray(item) then
            for j = 1, #item do
                len = len + 1
                result[len] = item[j]
            end
        else
            len = len + 1
            result[len] = item
        end
    end
    return result
end

local __TS__Symbol, Symbol
do
    local symbolMetatable = {__tostring = function(self)
        return ("Symbol(" .. (self.description or "")) .. ")"
    end}
    function __TS__Symbol(description)
        return setmetatable({description = description}, symbolMetatable)
    end
    Symbol = {
        asyncDispose = __TS__Symbol("Symbol.asyncDispose"),
        dispose = __TS__Symbol("Symbol.dispose"),
        iterator = __TS__Symbol("Symbol.iterator"),
        hasInstance = __TS__Symbol("Symbol.hasInstance"),
        species = __TS__Symbol("Symbol.species"),
        toStringTag = __TS__Symbol("Symbol.toStringTag")
    }
end

local function __TS__ArrayEntries(array)
    local key = 0
    return {
        [Symbol.iterator] = function(self)
            return self
        end,
        next = function(self)
            local result = {done = array[key + 1] == nil, value = {key, array[key + 1]}}
            key = key + 1
            return result
        end
    }
end

local function __TS__ArrayEvery(self, callbackfn, thisArg)
    for i = 1, #self do
        if not callbackfn(thisArg, self[i], i - 1, self) then
            return false
        end
    end
    return true
end

local function __TS__ArrayFill(self, value, start, ____end)
    local relativeStart = start or 0
    local relativeEnd = ____end or #self
    if relativeStart < 0 then
        relativeStart = relativeStart + #self
    end
    if relativeEnd < 0 then
        relativeEnd = relativeEnd + #self
    end
    do
        local i = relativeStart
        while i < relativeEnd do
            self[i + 1] = value
            i = i + 1
        end
    end
    return self
end

local function __TS__ArrayFilter(self, callbackfn, thisArg)
    local result = {}
    local len = 0
    for i = 1, #self do
        if callbackfn(thisArg, self[i], i - 1, self) then
            len = len + 1
            result[len] = self[i]
        end
    end
    return result
end

local function __TS__ArrayForEach(self, callbackFn, thisArg)
    for i = 1, #self do
        callbackFn(thisArg, self[i], i - 1, self)
    end
end

local function __TS__ArrayFind(self, predicate, thisArg)
    for i = 1, #self do
        local elem = self[i]
        if predicate(thisArg, elem, i - 1, self) then
            return elem
        end
    end
    return nil
end

local function __TS__ArrayFindIndex(self, callbackFn, thisArg)
    for i = 1, #self do
        if callbackFn(thisArg, self[i], i - 1, self) then
            return i - 1
        end
    end
    return -1
end

local __TS__Iterator
do
    local function iteratorGeneratorStep(self)
        local co = self.____coroutine
        local status, value = coroutine.resume(co)
        if not status then
            error(value, 0)
        end
        if coroutine.status(co) == "dead" then
            return
        end
        return true, value
    end
    local function iteratorIteratorStep(self)
        local result = self:next()
        if result.done then
            return
        end
        return true, result.value
    end
    local function iteratorStringStep(self, index)
        index = index + 1
        if index > #self then
            return
        end
        return index, string.sub(self, index, index)
    end
    function __TS__Iterator(iterable)
        if type(iterable) == "string" then
            return iteratorStringStep, iterable, 0
        elseif iterable.____coroutine ~= nil then
            return iteratorGeneratorStep, iterable
        elseif iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            return iteratorIteratorStep, iterator
        else
            return ipairs(iterable)
        end
    end
end

local __TS__ArrayFrom
do
    local function arrayLikeStep(self, index)
        index = index + 1
        if index > self.length then
            return
        end
        return index, self[index]
    end
    local function arrayLikeIterator(arr)
        if type(arr.length) == "number" then
            return arrayLikeStep, arr, 0
        end
        return __TS__Iterator(arr)
    end
    function __TS__ArrayFrom(arrayLike, mapFn, thisArg)
        local result = {}
        if mapFn == nil then
            for ____, v in arrayLikeIterator(arrayLike) do
                result[#result + 1] = v
            end
        else
            for i, v in arrayLikeIterator(arrayLike) do
                result[#result + 1] = mapFn(thisArg, v, i - 1)
            end
        end
        return result
    end
end

local function __TS__ArrayIncludes(self, searchElement, fromIndex)
    if fromIndex == nil then
        fromIndex = 0
    end
    local len = #self
    local k = fromIndex
    if fromIndex < 0 then
        k = len + fromIndex
    end
    if k < 0 then
        k = 0
    end
    for i = k + 1, len do
        if self[i] == searchElement then
            return true
        end
    end
    return false
end

local function __TS__ArrayIndexOf(self, searchElement, fromIndex)
    if fromIndex == nil then
        fromIndex = 0
    end
    local len = #self
    if len == 0 then
        return -1
    end
    if fromIndex >= len then
        return -1
    end
    if fromIndex < 0 then
        fromIndex = len + fromIndex
        if fromIndex < 0 then
            fromIndex = 0
        end
    end
    for i = fromIndex + 1, len do
        if self[i] == searchElement then
            return i - 1
        end
    end
    return -1
end

local function __TS__ArrayJoin(self, separator)
    if separator == nil then
        separator = ","
    end
    local parts = {}
    for i = 1, #self do
        parts[i] = tostring(self[i])
    end
    return table.concat(parts, separator)
end

local function __TS__ArrayMap(self, callbackfn, thisArg)
    local result = {}
    for i = 1, #self do
        result[i] = callbackfn(thisArg, self[i], i - 1, self)
    end
    return result
end

local function __TS__ArrayPush(self, ...)
    local items = {...}
    local len = #self
    for i = 1, #items do
        len = len + 1
        self[len] = items[i]
    end
    return len
end

local function __TS__ArrayPushArray(self, items)
    local len = #self
    for i = 1, #items do
        len = len + 1
        self[len] = items[i]
    end
    return len
end

local function __TS__CountVarargs(...)
    return select("#", ...)
end

local function __TS__ArrayReduce(self, callbackFn, ...)
    local len = #self
    local k = 0
    local accumulator = nil
    if __TS__CountVarargs(...) ~= 0 then
        accumulator = ...
    elseif len > 0 then
        accumulator = self[1]
        k = 1
    else
        error("Reduce of empty array with no initial value", 0)
    end
    for i = k + 1, len do
        accumulator = callbackFn(
            nil,
            accumulator,
            self[i],
            i - 1,
            self
        )
    end
    return accumulator
end

local function __TS__ArrayReduceRight(self, callbackFn, ...)
    local len = #self
    local k = len - 1
    local accumulator = nil
    if __TS__CountVarargs(...) ~= 0 then
        accumulator = ...
    elseif len > 0 then
        accumulator = self[k + 1]
        k = k - 1
    else
        error("Reduce of empty array with no initial value", 0)
    end
    for i = k + 1, 1, -1 do
        accumulator = callbackFn(
            nil,
            accumulator,
            self[i],
            i - 1,
            self
        )
    end
    return accumulator
end

local function __TS__ArrayReverse(self)
    local i = 1
    local j = #self
    while i < j do
        local temp = self[j]
        self[j] = self[i]
        self[i] = temp
        i = i + 1
        j = j - 1
    end
    return self
end

local function __TS__ArrayUnshift(self, ...)
    local items = {...}
    local numItemsToInsert = #items
    if numItemsToInsert == 0 then
        return #self
    end
    for i = #self, 1, -1 do
        self[i + numItemsToInsert] = self[i]
    end
    for i = 1, numItemsToInsert do
        self[i] = items[i]
    end
    return #self
end

local function __TS__ArraySort(self, compareFn)
    if compareFn ~= nil then
        table.sort(
            self,
            function(a, b) return compareFn(nil, a, b) < 0 end
        )
    else
        table.sort(self)
    end
    return self
end

local function __TS__ArraySlice(self, first, last)
    local len = #self
    first = first or 0
    if first < 0 then
        first = len + first
        if first < 0 then
            first = 0
        end
    else
        if first > len then
            first = len
        end
    end
    last = last or len
    if last < 0 then
        last = len + last
        if last < 0 then
            last = 0
        end
    else
        if last > len then
            last = len
        end
    end
    local out = {}
    first = first + 1
    last = last + 1
    local n = 1
    while first < last do
        out[n] = self[first]
        first = first + 1
        n = n + 1
    end
    return out
end

local function __TS__ArraySome(self, callbackfn, thisArg)
    for i = 1, #self do
        if callbackfn(thisArg, self[i], i - 1, self) then
            return true
        end
    end
    return false
end

local function __TS__ArraySplice(self, ...)
    local args = {...}
    local len = #self
    local actualArgumentCount = __TS__CountVarargs(...)
    local start = args[1]
    local deleteCount = args[2]
    if start < 0 then
        start = len + start
        if start < 0 then
            start = 0
        end
    elseif start > len then
        start = len
    end
    local itemCount = actualArgumentCount - 2
    if itemCount < 0 then
        itemCount = 0
    end
    local actualDeleteCount
    if actualArgumentCount == 0 then
        actualDeleteCount = 0
    elseif actualArgumentCount == 1 then
        actualDeleteCount = len - start
    else
        actualDeleteCount = deleteCount or 0
        if actualDeleteCount < 0 then
            actualDeleteCount = 0
        end
        if actualDeleteCount > len - start then
            actualDeleteCount = len - start
        end
    end
    local out = {}
    for k = 1, actualDeleteCount do
        local from = start + k
        if self[from] ~= nil then
            out[k] = self[from]
        end
    end
    if itemCount < actualDeleteCount then
        for k = start + 1, len - actualDeleteCount do
            local from = k + actualDeleteCount
            local to = k + itemCount
            if self[from] then
                self[to] = self[from]
            else
                self[to] = nil
            end
        end
        for k = len - actualDeleteCount + itemCount + 1, len do
            self[k] = nil
        end
    elseif itemCount > actualDeleteCount then
        for k = len - actualDeleteCount, start + 1, -1 do
            local from = k + actualDeleteCount
            local to = k + itemCount
            if self[from] then
                self[to] = self[from]
            else
                self[to] = nil
            end
        end
    end
    local j = start + 1
    for i = 3, actualArgumentCount do
        self[j] = args[i]
        j = j + 1
    end
    for k = #self, len - actualDeleteCount + itemCount + 1, -1 do
        self[k] = nil
    end
    return out
end

local function __TS__ArrayToObject(self)
    local object = {}
    for i = 1, #self do
        object[i - 1] = self[i]
    end
    return object
end

local function __TS__ArrayFlat(self, depth)
    if depth == nil then
        depth = 1
    end
    local result = {}
    local len = 0
    for i = 1, #self do
        local value = self[i]
        if depth > 0 and __TS__ArrayIsArray(value) then
            local toAdd
            if depth == 1 then
                toAdd = value
            else
                toAdd = __TS__ArrayFlat(value, depth - 1)
            end
            for j = 1, #toAdd do
                local val = toAdd[j]
                len = len + 1
                result[len] = val
            end
        else
            len = len + 1
            result[len] = value
        end
    end
    return result
end

local function __TS__ArrayFlatMap(self, callback, thisArg)
    local result = {}
    local len = 0
    for i = 1, #self do
        local value = callback(thisArg, self[i], i - 1, self)
        if __TS__ArrayIsArray(value) then
            for j = 1, #value do
                len = len + 1
                result[len] = value[j]
            end
        else
            len = len + 1
            result[len] = value
        end
    end
    return result
end

local function __TS__ArraySetLength(self, length)
    if length < 0 or length ~= length or length == math.huge or math.floor(length) ~= length then
        error(
            "invalid array length: " .. tostring(length),
            0
        )
    end
    for i = length + 1, #self do
        self[i] = nil
    end
    return length
end

local __TS__Unpack = table.unpack or unpack

local function __TS__ArrayToReversed(self)
    local copy = {__TS__Unpack(self)}
    __TS__ArrayReverse(copy)
    return copy
end

local function __TS__ArrayToSorted(self, compareFn)
    local copy = {__TS__Unpack(self)}
    __TS__ArraySort(copy, compareFn)
    return copy
end

local function __TS__ArrayToSpliced(self, start, deleteCount, ...)
    local copy = {__TS__Unpack(self)}
    __TS__ArraySplice(copy, start, deleteCount, ...)
    return copy
end

local function __TS__ArrayWith(self, index, value)
    local copy = {__TS__Unpack(self)}
    copy[index + 1] = value
    return copy
end

local function __TS__InstanceOf(obj, classTbl)
    if type(classTbl) ~= "table" then
        error("Right-hand side of 'instanceof' is not an object", 0)
    end
    if classTbl[Symbol.hasInstance] ~= nil then
        return not not classTbl[Symbol.hasInstance](classTbl, obj)
    end
    if type(obj) == "table" then
        local luaClass = obj.constructor
        while luaClass ~= nil do
            if luaClass == classTbl then
                return true
            end
            luaClass = luaClass.____super
        end
    end
    return false
end

local function __TS__New(target, ...)
    local instance = setmetatable({}, target.prototype)
    instance:____constructor(...)
    return instance
end

local function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

local function __TS__FunctionBind(fn, ...)
    local boundArgs = {...}
    return function(____, ...)
        local args = {...}
        __TS__ArrayUnshift(
            args,
            __TS__Unpack(boundArgs)
        )
        return fn(__TS__Unpack(args))
    end
end

local __TS__Promise
do
    local function promiseDeferred(self)
        local resolve
        local reject
        local promise = __TS__New(
            __TS__Promise,
            function(____, res, rej)
                resolve = res
                reject = rej
            end
        )
        return {promise = promise, resolve = resolve, reject = reject}
    end
    local function isPromiseLike(self, thing)
        return __TS__InstanceOf(thing, __TS__Promise)
    end
    __TS__Promise = __TS__Class()
    __TS__Promise.name = "__TS__Promise"
    function __TS__Promise.prototype.____constructor(self, executor)
        self.state = 0
        self.fulfilledCallbacks = {}
        self.rejectedCallbacks = {}
        self.finallyCallbacks = {}
        do
            local function ____catch(e)
                self:reject(e)
            end
            local ____try, ____hasReturned = pcall(function()
                executor(
                    nil,
                    __TS__FunctionBind(self.resolve, self),
                    __TS__FunctionBind(self.reject, self)
                )
            end)
            if not ____try then
                ____catch(____hasReturned)
            end
        end
    end
    function __TS__Promise.resolve(data)
        local promise = __TS__New(
            __TS__Promise,
            function()
            end
        )
        promise.state = 1
        promise.value = data
        return promise
    end
    function __TS__Promise.reject(reason)
        local promise = __TS__New(
            __TS__Promise,
            function()
            end
        )
        promise.state = 2
        promise.rejectionReason = reason
        return promise
    end
    __TS__Promise.prototype["then"] = function(self, onFulfilled, onRejected)
        local ____promiseDeferred_result_0 = promiseDeferred(nil)
        local promise = ____promiseDeferred_result_0.promise
        local resolve = ____promiseDeferred_result_0.resolve
        local reject = ____promiseDeferred_result_0.reject
        local isFulfilled = self.state == 1
        local isRejected = self.state == 2
        if onFulfilled then
            local internalCallback = self:createPromiseResolvingCallback(onFulfilled, resolve, reject)
            local ____self_fulfilledCallbacks_1 = self.fulfilledCallbacks
            ____self_fulfilledCallbacks_1[#____self_fulfilledCallbacks_1 + 1] = internalCallback
            if isFulfilled then
                internalCallback(nil, self.value)
            end
        else
            local ____self_fulfilledCallbacks_2 = self.fulfilledCallbacks
            ____self_fulfilledCallbacks_2[#____self_fulfilledCallbacks_2 + 1] = function(____, v) return resolve(nil, v) end
        end
        if onRejected then
            local internalCallback = self:createPromiseResolvingCallback(onRejected, resolve, reject)
            local ____self_rejectedCallbacks_3 = self.rejectedCallbacks
            ____self_rejectedCallbacks_3[#____self_rejectedCallbacks_3 + 1] = internalCallback
            if isRejected then
                internalCallback(nil, self.rejectionReason)
            end
        else
            local ____self_rejectedCallbacks_4 = self.rejectedCallbacks
            ____self_rejectedCallbacks_4[#____self_rejectedCallbacks_4 + 1] = function(____, err) return reject(nil, err) end
        end
        if isFulfilled then
            resolve(nil, self.value)
        end
        if isRejected then
            reject(nil, self.rejectionReason)
        end
        return promise
    end
    function __TS__Promise.prototype.catch(self, onRejected)
        return self["then"](self, nil, onRejected)
    end
    function __TS__Promise.prototype.finally(self, onFinally)
        if onFinally then
            local ____self_finallyCallbacks_5 = self.finallyCallbacks
            ____self_finallyCallbacks_5[#____self_finallyCallbacks_5 + 1] = onFinally
            if self.state ~= 0 then
                onFinally(nil)
            end
        end
        return self
    end
    function __TS__Promise.prototype.resolve(self, data)
        if __TS__InstanceOf(data, __TS__Promise) then
            data["then"](
                data,
                function(____, v) return self:resolve(v) end,
                function(____, err) return self:reject(err) end
            )
            return
        end
        if self.state == 0 then
            self.state = 1
            self.value = data
            for ____, callback in ipairs(self.fulfilledCallbacks) do
                callback(nil, data)
            end
            for ____, callback in ipairs(self.finallyCallbacks) do
                callback(nil)
            end
        end
    end
    function __TS__Promise.prototype.reject(self, reason)
        if self.state == 0 then
            self.state = 2
            self.rejectionReason = reason
            for ____, callback in ipairs(self.rejectedCallbacks) do
                callback(nil, reason)
            end
            for ____, callback in ipairs(self.finallyCallbacks) do
                callback(nil)
            end
        end
    end
    function __TS__Promise.prototype.createPromiseResolvingCallback(self, f, resolve, reject)
        return function(____, value)
            do
                local function ____catch(e)
                    reject(nil, e)
                end
                local ____try, ____hasReturned = pcall(function()
                    self:handleCallbackData(
                        f(nil, value),
                        resolve,
                        reject
                    )
                end)
                if not ____try then
                    ____catch(____hasReturned)
                end
            end
        end
    end
    function __TS__Promise.prototype.handleCallbackData(self, data, resolve, reject)
        if isPromiseLike(nil, data) then
            local nextpromise = data
            if nextpromise.state == 1 then
                resolve(nil, nextpromise.value)
            elseif nextpromise.state == 2 then
                reject(nil, nextpromise.rejectionReason)
            else
                data["then"](data, resolve, reject)
            end
        else
            resolve(nil, data)
        end
    end
end

local function __TS__AsyncAwaiter(generator)
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            local adopt, fulfilled, step, resolved, asyncCoroutine
            function adopt(self, value)
                return __TS__InstanceOf(value, __TS__Promise) and value or __TS__Promise.resolve(value)
            end
            function fulfilled(self, value)
                local success, resultOrError = coroutine.resume(asyncCoroutine, value)
                if success then
                    step(nil, resultOrError)
                else
                    reject(nil, resultOrError)
                end
            end
            function step(self, result)
                if resolved then
                    return
                end
                if coroutine.status(asyncCoroutine) == "dead" then
                    resolve(nil, result)
                else
                    local ____self_0 = adopt(nil, result)
                    ____self_0["then"](____self_0, fulfilled, reject)
                end
            end
            resolved = false
            asyncCoroutine = coroutine.create(generator)
            local success, resultOrError = coroutine.resume(
                asyncCoroutine,
                function(____, v)
                    resolved = true
                    local ____self_1 = adopt(nil, v)
                    ____self_1["then"](____self_1, resolve, reject)
                end
            )
            if success then
                step(nil, resultOrError)
            else
                reject(nil, resultOrError)
            end
        end
    )
end
local function __TS__Await(thing)
    return coroutine.yield(thing)
end

local function __TS__ClassExtends(target, base)
    target.____super = base
    local staticMetatable = setmetatable({__index = base}, base)
    setmetatable(target, staticMetatable)
    local baseMetatable = getmetatable(base)
    if baseMetatable then
        if type(baseMetatable.__index) == "function" then
            staticMetatable.__index = baseMetatable.__index
        end
        if type(baseMetatable.__newindex) == "function" then
            staticMetatable.__newindex = baseMetatable.__newindex
        end
    end
    setmetatable(target.prototype, base.prototype)
    if type(base.prototype.__index) == "function" then
        target.prototype.__index = base.prototype.__index
    end
    if type(base.prototype.__newindex) == "function" then
        target.prototype.__newindex = base.prototype.__newindex
    end
    if type(base.prototype.__tostring) == "function" then
        target.prototype.__tostring = base.prototype.__tostring
    end
end

local function __TS__CloneDescriptor(____bindingPattern0)
    local value
    local writable
    local set
    local get
    local configurable
    local enumerable
    enumerable = ____bindingPattern0.enumerable
    configurable = ____bindingPattern0.configurable
    get = ____bindingPattern0.get
    set = ____bindingPattern0.set
    writable = ____bindingPattern0.writable
    value = ____bindingPattern0.value
    local descriptor = {enumerable = enumerable == true, configurable = configurable == true}
    local hasGetterOrSetter = get ~= nil or set ~= nil
    local hasValueOrWritableAttribute = writable ~= nil or value ~= nil
    if hasGetterOrSetter and hasValueOrWritableAttribute then
        error("Invalid property descriptor. Cannot both specify accessors and a value or writable attribute.", 0)
    end
    if get or set then
        descriptor.get = get
        descriptor.set = set
    else
        descriptor.value = value
        descriptor.writable = writable == true
    end
    return descriptor
end

local function __TS__Decorate(self, originalValue, decorators, context)
    local result = originalValue
    do
        local i = #decorators
        while i >= 0 do
            local decorator = decorators[i + 1]
            if decorator ~= nil then
                local ____decorator_result_0 = decorator(self, result, context)
                if ____decorator_result_0 == nil then
                    ____decorator_result_0 = result
                end
                result = ____decorator_result_0
            end
            i = i - 1
        end
    end
    return result
end

local function __TS__ObjectAssign(target, ...)
    local sources = {...}
    for i = 1, #sources do
        local source = sources[i]
        for key in pairs(source) do
            target[key] = source[key]
        end
    end
    return target
end

local function __TS__ObjectGetOwnPropertyDescriptor(object, key)
    local metatable = getmetatable(object)
    if not metatable then
        return
    end
    if not rawget(metatable, "_descriptors") then
        return
    end
    return rawget(metatable, "_descriptors")[key]
end

local __TS__SetDescriptor
do
    local function descriptorIndex(self, key)
        local value = rawget(self, key)
        if value ~= nil then
            return value
        end
        local metatable = getmetatable(self)
        while metatable do
            local rawResult = rawget(metatable, key)
            if rawResult ~= nil then
                return rawResult
            end
            local descriptors = rawget(metatable, "_descriptors")
            if descriptors then
                local descriptor = descriptors[key]
                if descriptor ~= nil then
                    if descriptor.get then
                        return descriptor.get(self)
                    end
                    return descriptor.value
                end
            end
            metatable = getmetatable(metatable)
        end
    end
    local function descriptorNewIndex(self, key, value)
        local metatable = getmetatable(self)
        while metatable do
            local descriptors = rawget(metatable, "_descriptors")
            if descriptors then
                local descriptor = descriptors[key]
                if descriptor ~= nil then
                    if descriptor.set then
                        descriptor.set(self, value)
                    else
                        if descriptor.writable == false then
                            error(
                                ((("Cannot assign to read only property '" .. key) .. "' of object '") .. tostring(self)) .. "'",
                                0
                            )
                        end
                        descriptor.value = value
                    end
                    return
                end
            end
            metatable = getmetatable(metatable)
        end
        rawset(self, key, value)
    end
    function __TS__SetDescriptor(target, key, desc, isPrototype)
        if isPrototype == nil then
            isPrototype = false
        end
        local ____isPrototype_0
        if isPrototype then
            ____isPrototype_0 = target
        else
            ____isPrototype_0 = getmetatable(target)
        end
        local metatable = ____isPrototype_0
        if not metatable then
            metatable = {}
            setmetatable(target, metatable)
        end
        local value = rawget(target, key)
        if value ~= nil then
            rawset(target, key, nil)
        end
        if not rawget(metatable, "_descriptors") then
            metatable._descriptors = {}
        end
        metatable._descriptors[key] = __TS__CloneDescriptor(desc)
        metatable.__index = descriptorIndex
        metatable.__newindex = descriptorNewIndex
    end
end

local function __TS__DecorateLegacy(decorators, target, key, desc)
    local result = target
    do
        local i = #decorators
        while i >= 0 do
            local decorator = decorators[i + 1]
            if decorator ~= nil then
                local oldResult = result
                if key == nil then
                    result = decorator(nil, result)
                elseif desc == true then
                    local value = rawget(target, key)
                    local descriptor = __TS__ObjectGetOwnPropertyDescriptor(target, key) or ({configurable = true, writable = true, value = value})
                    local desc = decorator(nil, target, key, descriptor) or descriptor
                    local isSimpleValue = desc.configurable == true and desc.writable == true and not desc.get and not desc.set
                    if isSimpleValue then
                        rawset(target, key, desc.value)
                    else
                        __TS__SetDescriptor(
                            target,
                            key,
                            __TS__ObjectAssign({}, descriptor, desc)
                        )
                    end
                elseif desc == false then
                    result = decorator(nil, target, key, desc)
                else
                    result = decorator(nil, target, key)
                end
                result = result or oldResult
            end
            i = i - 1
        end
    end
    return result
end

local function __TS__DecorateParam(paramIndex, decorator)
    return function(____, target, key) return decorator(nil, target, key, paramIndex) end
end

local function __TS__StringIncludes(self, searchString, position)
    if not position then
        position = 1
    else
        position = position + 1
    end
    local index = string.find(self, searchString, position, true)
    return index ~= nil
end

local Error, RangeError, ReferenceError, SyntaxError, TypeError, URIError
do
    local function getErrorStack(self, constructor)
        if debug == nil then
            return nil
        end
        local level = 1
        while true do
            local info = debug.getinfo(level, "f")
            level = level + 1
            if not info then
                level = 1
                break
            elseif info.func == constructor then
                break
            end
        end
        if __TS__StringIncludes(_VERSION, "Lua 5.0") then
            return debug.traceback(("[Level " .. tostring(level)) .. "]")
        else
            return debug.traceback(nil, level)
        end
    end
    local function wrapErrorToString(self, getDescription)
        return function(self)
            local description = getDescription(self)
            local caller = debug.getinfo(3, "f")
            local isClassicLua = __TS__StringIncludes(_VERSION, "Lua 5.0") or _VERSION == "Lua 5.1"
            if isClassicLua or caller and caller.func ~= error then
                return description
            else
                return (description .. "\n") .. tostring(self.stack)
            end
        end
    end
    local function initErrorClass(self, Type, name)
        Type.name = name
        return setmetatable(
            Type,
            {__call = function(____, _self, message) return __TS__New(Type, message) end}
        )
    end
    local ____initErrorClass_1 = initErrorClass
    local ____class_0 = __TS__Class()
    ____class_0.name = ""
    function ____class_0.prototype.____constructor(self, message)
        if message == nil then
            message = ""
        end
        self.message = message
        self.name = "Error"
        self.stack = getErrorStack(nil, self.constructor.new)
        local metatable = getmetatable(self)
        if metatable and not metatable.__errorToStringPatched then
            metatable.__errorToStringPatched = true
            metatable.__tostring = wrapErrorToString(nil, metatable.__tostring)
        end
    end
    function ____class_0.prototype.__tostring(self)
        return self.message ~= "" and (self.name .. ": ") .. self.message or self.name
    end
    Error = ____initErrorClass_1(nil, ____class_0, "Error")
    local function createErrorClass(self, name)
        local ____initErrorClass_3 = initErrorClass
        local ____class_2 = __TS__Class()
        ____class_2.name = ____class_2.name
        __TS__ClassExtends(____class_2, Error)
        function ____class_2.prototype.____constructor(self, ...)
            ____class_2.____super.prototype.____constructor(self, ...)
            self.name = name
        end
        return ____initErrorClass_3(nil, ____class_2, name)
    end
    RangeError = createErrorClass(nil, "RangeError")
    ReferenceError = createErrorClass(nil, "ReferenceError")
    SyntaxError = createErrorClass(nil, "SyntaxError")
    TypeError = createErrorClass(nil, "TypeError")
    URIError = createErrorClass(nil, "URIError")
end

local function __TS__ObjectGetOwnPropertyDescriptors(object)
    local metatable = getmetatable(object)
    if not metatable then
        return {}
    end
    return rawget(metatable, "_descriptors") or ({})
end

local function __TS__Delete(target, key)
    local descriptors = __TS__ObjectGetOwnPropertyDescriptors(target)
    local descriptor = descriptors[key]
    if descriptor then
        if not descriptor.configurable then
            error(
                __TS__New(
                    TypeError,
                    ((("Cannot delete property " .. tostring(key)) .. " of ") .. tostring(target)) .. "."
                ),
                0
            )
        end
        descriptors[key] = nil
        return true
    end
    target[key] = nil
    return true
end

local function __TS__StringAccess(self, index)
    if index >= 0 and index < #self then
        return string.sub(self, index + 1, index + 1)
    end
end

local function __TS__DelegatedYield(iterable)
    if type(iterable) == "string" then
        for index = 0, #iterable - 1 do
            coroutine.yield(__TS__StringAccess(iterable, index))
        end
    elseif iterable.____coroutine ~= nil then
        local co = iterable.____coroutine
        while true do
            local status, value = coroutine.resume(co)
            if not status then
                error(value, 0)
            end
            if coroutine.status(co) == "dead" then
                return value
            else
                coroutine.yield(value)
            end
        end
    elseif iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                return result.value
            else
                coroutine.yield(result.value)
            end
        end
    else
        for ____, value in ipairs(iterable) do
            coroutine.yield(value)
        end
    end
end

local __TS__Generator
do
    local function generatorIterator(self)
        return self
    end
    local function generatorNext(self, ...)
        local co = self.____coroutine
        if coroutine.status(co) == "dead" then
            return {done = true}
        end
        local status, value = coroutine.resume(co, ...)
        if not status then
            error(value, 0)
        end
        return {
            value = value,
            done = coroutine.status(co) == "dead"
        }
    end
    function __TS__Generator(fn)
        return function(...)
            local args = {...}
            local argsLength = __TS__CountVarargs(...)
            return {
                ____coroutine = coroutine.create(function() return fn(__TS__Unpack(args, 1, argsLength)) end),
                [Symbol.iterator] = generatorIterator,
                next = generatorNext
            }
        end
    end
end

local function __TS__InstanceOfObject(value)
    local valueType = type(value)
    return valueType == "table" or valueType == "function"
end

local function __TS__LuaIteratorSpread(self, state, firstKey)
    local results = {}
    local key, value = self(state, firstKey)
    while key do
        results[#results + 1] = {key, value}
        key, value = self(state, key)
    end
    return __TS__Unpack(results)
end

local Map
do
    Map = __TS__Class()
    Map.name = "Map"
    function Map.prototype.____constructor(self, entries)
        self[Symbol.toStringTag] = "Map"
        self.items = {}
        self.size = 0
        self.nextKey = {}
        self.previousKey = {}
        if entries == nil then
            return
        end
        local iterable = entries
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                local value = result.value
                self:set(value[1], value[2])
            end
        else
            local array = entries
            for ____, kvp in ipairs(array) do
                self:set(kvp[1], kvp[2])
            end
        end
    end
    function Map.prototype.clear(self)
        self.items = {}
        self.nextKey = {}
        self.previousKey = {}
        self.firstKey = nil
        self.lastKey = nil
        self.size = 0
    end
    function Map.prototype.delete(self, key)
        local contains = self:has(key)
        if contains then
            self.size = self.size - 1
            local next = self.nextKey[key]
            local previous = self.previousKey[key]
            if next ~= nil and previous ~= nil then
                self.nextKey[previous] = next
                self.previousKey[next] = previous
            elseif next ~= nil then
                self.firstKey = next
                self.previousKey[next] = nil
            elseif previous ~= nil then
                self.lastKey = previous
                self.nextKey[previous] = nil
            else
                self.firstKey = nil
                self.lastKey = nil
            end
            self.nextKey[key] = nil
            self.previousKey[key] = nil
        end
        self.items[key] = nil
        return contains
    end
    function Map.prototype.forEach(self, callback)
        for ____, key in __TS__Iterator(self:keys()) do
            callback(nil, self.items[key], key, self)
        end
    end
    function Map.prototype.get(self, key)
        return self.items[key]
    end
    function Map.prototype.has(self, key)
        return self.nextKey[key] ~= nil or self.lastKey == key
    end
    function Map.prototype.set(self, key, value)
        local isNewValue = not self:has(key)
        if isNewValue then
            self.size = self.size + 1
        end
        self.items[key] = value
        if self.firstKey == nil then
            self.firstKey = key
            self.lastKey = key
        elseif isNewValue then
            self.nextKey[self.lastKey] = key
            self.previousKey[key] = self.lastKey
            self.lastKey = key
        end
        return self
    end
    Map.prototype[Symbol.iterator] = function(self)
        return self:entries()
    end
    function Map.prototype.entries(self)
        local items = self.items
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = {key, items[key]}}
                key = nextKey[key]
                return result
            end
        }
    end
    function Map.prototype.keys(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    function Map.prototype.values(self)
        local items = self.items
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = items[key]}
                key = nextKey[key]
                return result
            end
        }
    end
    Map[Symbol.species] = Map
end

local __TS__Match = string.match

local __TS__MathAtan2 = math.atan2 or math.atan

local __TS__MathModf = math.modf

local function __TS__MathSign(val)
    if val > 0 then
        return 1
    elseif val < 0 then
        return -1
    end
    return 0
end

local function __TS__Number(value)
    local valueType = type(value)
    if valueType == "number" then
        return value
    elseif valueType == "string" then
        local numberValue = tonumber(value)
        if numberValue then
            return numberValue
        end
        if value == "Infinity" then
            return math.huge
        end
        if value == "-Infinity" then
            return -math.huge
        end
        local stringWithoutSpaces = string.gsub(value, "%s", "")
        if stringWithoutSpaces == "" then
            return 0
        end
        return 0 / 0
    elseif valueType == "boolean" then
        return value and 1 or 0
    else
        return 0 / 0
    end
end

local function __TS__NumberIsFinite(value)
    return type(value) == "number" and value == value and value ~= math.huge and value ~= -math.huge
end

local function __TS__NumberIsInteger(value)
    return __TS__NumberIsFinite(value) and math.floor(value) == value
end

local function __TS__NumberIsNaN(value)
    return value ~= value
end

local function __TS__StringSubstring(self, start, ____end)
    if ____end ~= ____end then
        ____end = 0
    end
    if ____end ~= nil and start > ____end then
        start, ____end = ____end, start
    end
    if start >= 0 then
        start = start + 1
    else
        start = 1
    end
    if ____end ~= nil and ____end < 0 then
        ____end = 0
    end
    return string.sub(self, start, ____end)
end

local __TS__ParseInt
do
    local parseIntBasePattern = "0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTvVwWxXyYzZ"
    function __TS__ParseInt(numberString, base)
        if base == nil then
            base = 10
            local hexMatch = __TS__Match(numberString, "^%s*-?0[xX]")
            if hexMatch ~= nil then
                base = 16
                numberString = (__TS__Match(hexMatch, "-")) and "-" .. __TS__StringSubstring(numberString, #hexMatch) or __TS__StringSubstring(numberString, #hexMatch)
            end
        end
        if base < 2 or base > 36 then
            return 0 / 0
        end
        local allowedDigits = base <= 10 and __TS__StringSubstring(parseIntBasePattern, 0, base) or __TS__StringSubstring(parseIntBasePattern, 0, 10 + 2 * (base - 10))
        local pattern = ("^%s*(-?[" .. allowedDigits) .. "]*)"
        local number = tonumber((__TS__Match(numberString, pattern)), base)
        if number == nil then
            return 0 / 0
        end
        if number >= 0 then
            return math.floor(number)
        else
            return math.ceil(number)
        end
    end
end

local function __TS__ParseFloat(numberString)
    local infinityMatch = __TS__Match(numberString, "^%s*(-?Infinity)")
    if infinityMatch ~= nil then
        return __TS__StringAccess(infinityMatch, 0) == "-" and -math.huge or math.huge
    end
    local number = tonumber((__TS__Match(numberString, "^%s*(-?%d+%.?%d*)")))
    return number or 0 / 0
end

local __TS__NumberToString
do
    local radixChars = "0123456789abcdefghijklmnopqrstuvwxyz"
    function __TS__NumberToString(self, radix)
        if radix == nil or radix == 10 or self == math.huge or self == -math.huge or self ~= self then
            return tostring(self)
        end
        radix = math.floor(radix)
        if radix < 2 or radix > 36 then
            error("toString() radix argument must be between 2 and 36", 0)
        end
        local integer, fraction = __TS__MathModf(math.abs(self))
        local result = ""
        if radix == 8 then
            result = string.format("%o", integer)
        elseif radix == 16 then
            result = string.format("%x", integer)
        else
            repeat
                do
                    result = __TS__StringAccess(radixChars, integer % radix) .. result
                    integer = math.floor(integer / radix)
                end
            until not (integer ~= 0)
        end
        if fraction ~= 0 then
            result = result .. "."
            local delta = 1e-16
            repeat
                do
                    fraction = fraction * radix
                    delta = delta * radix
                    local digit = math.floor(fraction)
                    result = result .. __TS__StringAccess(radixChars, digit)
                    fraction = fraction - digit
                end
            until not (fraction >= delta)
        end
        if self < 0 then
            result = "-" .. result
        end
        return result
    end
end

local function __TS__NumberToFixed(self, fractionDigits)
    if math.abs(self) >= 1e+21 or self ~= self then
        return tostring(self)
    end
    local f = math.floor(fractionDigits or 0)
    if f < 0 or f > 99 then
        error("toFixed() digits argument must be between 0 and 99", 0)
    end
    return string.format(
        ("%." .. tostring(f)) .. "f",
        self
    )
end

local function __TS__ObjectDefineProperty(target, key, desc)
    local luaKey = type(key) == "number" and key + 1 or key
    local value = rawget(target, luaKey)
    local hasGetterOrSetter = desc.get ~= nil or desc.set ~= nil
    local descriptor
    if hasGetterOrSetter then
        if value ~= nil then
            error(
                "Cannot redefine property: " .. tostring(key),
                0
            )
        end
        descriptor = desc
    else
        local valueExists = value ~= nil
        local ____desc_set_4 = desc.set
        local ____desc_get_5 = desc.get
        local ____temp_0
        if desc.configurable ~= nil then
            ____temp_0 = desc.configurable
        else
            ____temp_0 = valueExists
        end
        local ____temp_1
        if desc.enumerable ~= nil then
            ____temp_1 = desc.enumerable
        else
            ____temp_1 = valueExists
        end
        local ____temp_2
        if desc.writable ~= nil then
            ____temp_2 = desc.writable
        else
            ____temp_2 = valueExists
        end
        local ____temp_3
        if desc.value ~= nil then
            ____temp_3 = desc.value
        else
            ____temp_3 = value
        end
        descriptor = {
            set = ____desc_set_4,
            get = ____desc_get_5,
            configurable = ____temp_0,
            enumerable = ____temp_1,
            writable = ____temp_2,
            value = ____temp_3
        }
    end
    __TS__SetDescriptor(target, luaKey, descriptor)
    return target
end

local function __TS__ObjectEntries(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = {key, obj[key]}
    end
    return result
end

local function __TS__ObjectFromEntries(entries)
    local obj = {}
    local iterable = entries
    if iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                break
            end
            local value = result.value
            obj[value[1]] = value[2]
        end
    else
        for ____, entry in ipairs(entries) do
            obj[entry[1]] = entry[2]
        end
    end
    return obj
end

local function __TS__ObjectKeys(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = key
    end
    return result
end

local function __TS__ObjectRest(target, usedProperties)
    local result = {}
    for property in pairs(target) do
        if not usedProperties[property] then
            result[property] = target[property]
        end
    end
    return result
end

local function __TS__ObjectValues(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = obj[key]
    end
    return result
end

local function __TS__PromiseAll(iterable)
    local results = {}
    local toResolve = {}
    local numToResolve = 0
    local i = 0
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                results[i + 1] = item.value
            elseif item.state == 2 then
                return __TS__Promise.reject(item.rejectionReason)
            else
                numToResolve = numToResolve + 1
                toResolve[i] = item
            end
        else
            results[i + 1] = item
        end
        i = i + 1
    end
    if numToResolve == 0 then
        return __TS__Promise.resolve(results)
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for index, promise in pairs(toResolve) do
                promise["then"](
                    promise,
                    function(____, data)
                        results[index + 1] = data
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(nil, results)
                        end
                    end,
                    function(____, reason)
                        reject(nil, reason)
                    end
                )
            end
        end
    )
end

local function __TS__PromiseAllSettled(iterable)
    local results = {}
    local toResolve = {}
    local numToResolve = 0
    local i = 0
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                results[i + 1] = {status = "fulfilled", value = item.value}
            elseif item.state == 2 then
                results[i + 1] = {status = "rejected", reason = item.rejectionReason}
            else
                numToResolve = numToResolve + 1
                toResolve[i] = item
            end
        else
            results[i + 1] = {status = "fulfilled", value = item}
        end
        i = i + 1
    end
    if numToResolve == 0 then
        return __TS__Promise.resolve(results)
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve)
            for index, promise in pairs(toResolve) do
                promise["then"](
                    promise,
                    function(____, data)
                        results[index + 1] = {status = "fulfilled", value = data}
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(nil, results)
                        end
                    end,
                    function(____, reason)
                        results[index + 1] = {status = "rejected", reason = reason}
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(nil, results)
                        end
                    end
                )
            end
        end
    )
end

local function __TS__PromiseAny(iterable)
    local rejections = {}
    local pending = {}
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                return __TS__Promise.resolve(item.value)
            elseif item.state == 2 then
                rejections[#rejections + 1] = item.rejectionReason
            else
                pending[#pending + 1] = item
            end
        else
            return __TS__Promise.resolve(item)
        end
    end
    if #pending == 0 then
        return __TS__Promise.reject("No promises to resolve with .any()")
    end
    local numResolved = 0
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for ____, promise in ipairs(pending) do
                promise["then"](
                    promise,
                    function(____, data)
                        resolve(nil, data)
                    end,
                    function(____, reason)
                        rejections[#rejections + 1] = reason
                        numResolved = numResolved + 1
                        if numResolved == #pending then
                            reject(nil, {name = "AggregateError", message = "All Promises rejected", errors = rejections})
                        end
                    end
                )
            end
        end
    )
end

local function __TS__PromiseRace(iterable)
    local pending = {}
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                return __TS__Promise.resolve(item.value)
            elseif item.state == 2 then
                return __TS__Promise.reject(item.rejectionReason)
            else
                pending[#pending + 1] = item
            end
        else
            return __TS__Promise.resolve(item)
        end
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for ____, promise in ipairs(pending) do
                promise["then"](
                    promise,
                    function(____, value) return resolve(nil, value) end,
                    function(____, reason) return reject(nil, reason) end
                )
            end
        end
    )
end

local Set
do
    Set = __TS__Class()
    Set.name = "Set"
    function Set.prototype.____constructor(self, values)
        self[Symbol.toStringTag] = "Set"
        self.size = 0
        self.nextKey = {}
        self.previousKey = {}
        if values == nil then
            return
        end
        local iterable = values
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                self:add(result.value)
            end
        else
            local array = values
            for ____, value in ipairs(array) do
                self:add(value)
            end
        end
    end
    function Set.prototype.add(self, value)
        local isNewValue = not self:has(value)
        if isNewValue then
            self.size = self.size + 1
        end
        if self.firstKey == nil then
            self.firstKey = value
            self.lastKey = value
        elseif isNewValue then
            self.nextKey[self.lastKey] = value
            self.previousKey[value] = self.lastKey
            self.lastKey = value
        end
        return self
    end
    function Set.prototype.clear(self)
        self.nextKey = {}
        self.previousKey = {}
        self.firstKey = nil
        self.lastKey = nil
        self.size = 0
    end
    function Set.prototype.delete(self, value)
        local contains = self:has(value)
        if contains then
            self.size = self.size - 1
            local next = self.nextKey[value]
            local previous = self.previousKey[value]
            if next ~= nil and previous ~= nil then
                self.nextKey[previous] = next
                self.previousKey[next] = previous
            elseif next ~= nil then
                self.firstKey = next
                self.previousKey[next] = nil
            elseif previous ~= nil then
                self.lastKey = previous
                self.nextKey[previous] = nil
            else
                self.firstKey = nil
                self.lastKey = nil
            end
            self.nextKey[value] = nil
            self.previousKey[value] = nil
        end
        return contains
    end
    function Set.prototype.forEach(self, callback)
        for ____, key in __TS__Iterator(self:keys()) do
            callback(nil, key, key, self)
        end
    end
    function Set.prototype.has(self, value)
        return self.nextKey[value] ~= nil or self.lastKey == value
    end
    Set.prototype[Symbol.iterator] = function(self)
        return self:values()
    end
    function Set.prototype.entries(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = {key, key}}
                key = nextKey[key]
                return result
            end
        }
    end
    function Set.prototype.keys(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    function Set.prototype.values(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    Set[Symbol.species] = Set
end

local function __TS__SparseArrayNew(...)
    local sparseArray = {...}
    sparseArray.sparseLength = __TS__CountVarargs(...)
    return sparseArray
end

local function __TS__SparseArrayPush(sparseArray, ...)
    local args = {...}
    local argsLen = __TS__CountVarargs(...)
    local listLen = sparseArray.sparseLength
    for i = 1, argsLen do
        sparseArray[listLen + i] = args[i]
    end
    sparseArray.sparseLength = listLen + argsLen
end

local function __TS__SparseArraySpread(sparseArray)
    local _unpack = unpack or table.unpack
    return _unpack(sparseArray, 1, sparseArray.sparseLength)
end

local WeakMap
do
    WeakMap = __TS__Class()
    WeakMap.name = "WeakMap"
    function WeakMap.prototype.____constructor(self, entries)
        self[Symbol.toStringTag] = "WeakMap"
        self.items = {}
        setmetatable(self.items, {__mode = "k"})
        if entries == nil then
            return
        end
        local iterable = entries
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                local value = result.value
                self.items[value[1]] = value[2]
            end
        else
            for ____, kvp in ipairs(entries) do
                self.items[kvp[1]] = kvp[2]
            end
        end
    end
    function WeakMap.prototype.delete(self, key)
        local contains = self:has(key)
        self.items[key] = nil
        return contains
    end
    function WeakMap.prototype.get(self, key)
        return self.items[key]
    end
    function WeakMap.prototype.has(self, key)
        return self.items[key] ~= nil
    end
    function WeakMap.prototype.set(self, key, value)
        self.items[key] = value
        return self
    end
    WeakMap[Symbol.species] = WeakMap
end

local WeakSet
do
    WeakSet = __TS__Class()
    WeakSet.name = "WeakSet"
    function WeakSet.prototype.____constructor(self, values)
        self[Symbol.toStringTag] = "WeakSet"
        self.items = {}
        setmetatable(self.items, {__mode = "k"})
        if values == nil then
            return
        end
        local iterable = values
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                self.items[result.value] = true
            end
        else
            for ____, value in ipairs(values) do
                self.items[value] = true
            end
        end
    end
    function WeakSet.prototype.add(self, value)
        self.items[value] = true
        return self
    end
    function WeakSet.prototype.delete(self, value)
        local contains = self:has(value)
        self.items[value] = nil
        return contains
    end
    function WeakSet.prototype.has(self, value)
        return self.items[value] == true
    end
    WeakSet[Symbol.species] = WeakSet
end

local function __TS__SourceMapTraceBack(fileName, sourceMap)
    _G.__TS__sourcemap = _G.__TS__sourcemap or ({})
    _G.__TS__sourcemap[fileName] = sourceMap
    if _G.__TS__originalTraceback == nil then
        local originalTraceback = debug.traceback
        _G.__TS__originalTraceback = originalTraceback
        debug.traceback = function(thread, message, level)
            local trace
            if thread == nil and message == nil and level == nil then
                trace = originalTraceback()
            elseif __TS__StringIncludes(_VERSION, "Lua 5.0") then
                trace = originalTraceback((("[Level " .. tostring(level)) .. "] ") .. tostring(message))
            else
                trace = originalTraceback(thread, message, level)
            end
            if type(trace) ~= "string" then
                return trace
            end
            local function replacer(____, file, srcFile, line)
                local fileSourceMap = _G.__TS__sourcemap[file]
                if fileSourceMap ~= nil and fileSourceMap[line] ~= nil then
                    local data = fileSourceMap[line]
                    if type(data) == "number" then
                        return (srcFile .. ":") .. tostring(data)
                    end
                    return (data.file .. ":") .. tostring(data.line)
                end
                return (file .. ":") .. line
            end
            local result = string.gsub(
                trace,
                "(%S+)%.lua:(%d+)",
                function(file, line) return replacer(nil, file .. ".lua", file .. ".ts", line) end
            )
            local function stringReplacer(____, file, line)
                local fileSourceMap = _G.__TS__sourcemap[file]
                if fileSourceMap ~= nil and fileSourceMap[line] ~= nil then
                    local chunkName = (__TS__Match(file, "%[string \"([^\"]+)\"%]"))
                    local sourceName = string.gsub(chunkName, ".lua$", ".ts")
                    local data = fileSourceMap[line]
                    if type(data) == "number" then
                        return (sourceName .. ":") .. tostring(data)
                    end
                    return (data.file .. ":") .. tostring(data.line)
                end
                return (file .. ":") .. line
            end
            result = string.gsub(
                result,
                "(%[string \"[^\"]+\"%]):(%d+)",
                function(file, line) return stringReplacer(nil, file, line) end
            )
            return result
        end
    end
end

local function __TS__Spread(iterable)
    local arr = {}
    if type(iterable) == "string" then
        for i = 0, #iterable - 1 do
            arr[i + 1] = __TS__StringAccess(iterable, i)
        end
    else
        local len = 0
        for ____, item in __TS__Iterator(iterable) do
            len = len + 1
            arr[len] = item
        end
    end
    return __TS__Unpack(arr)
end

local function __TS__StringCharAt(self, pos)
    if pos ~= pos then
        pos = 0
    end
    if pos < 0 then
        return ""
    end
    return string.sub(self, pos + 1, pos + 1)
end

local function __TS__StringCharCodeAt(self, index)
    if index ~= index then
        index = 0
    end
    if index < 0 then
        return 0 / 0
    end
    return string.byte(self, index + 1) or 0 / 0
end

local function __TS__StringEndsWith(self, searchString, endPosition)
    if endPosition == nil or endPosition > #self then
        endPosition = #self
    end
    return string.sub(self, endPosition - #searchString + 1, endPosition) == searchString
end

local function __TS__StringPadEnd(self, maxLength, fillString)
    if fillString == nil then
        fillString = " "
    end
    if maxLength ~= maxLength then
        maxLength = 0
    end
    if maxLength == -math.huge or maxLength == math.huge then
        error("Invalid string length", 0)
    end
    if #self >= maxLength or #fillString == 0 then
        return self
    end
    maxLength = maxLength - #self
    if maxLength > #fillString then
        fillString = fillString .. string.rep(
            fillString,
            math.floor(maxLength / #fillString)
        )
    end
    return self .. string.sub(
        fillString,
        1,
        math.floor(maxLength)
    )
end

local function __TS__StringPadStart(self, maxLength, fillString)
    if fillString == nil then
        fillString = " "
    end
    if maxLength ~= maxLength then
        maxLength = 0
    end
    if maxLength == -math.huge or maxLength == math.huge then
        error("Invalid string length", 0)
    end
    if #self >= maxLength or #fillString == 0 then
        return self
    end
    maxLength = maxLength - #self
    if maxLength > #fillString then
        fillString = fillString .. string.rep(
            fillString,
            math.floor(maxLength / #fillString)
        )
    end
    return string.sub(
        fillString,
        1,
        math.floor(maxLength)
    ) .. self
end

local __TS__StringReplace
do
    local sub = string.sub
    function __TS__StringReplace(source, searchValue, replaceValue)
        local startPos, endPos = string.find(source, searchValue, nil, true)
        if not startPos then
            return source
        end
        local before = sub(source, 1, startPos - 1)
        local replacement = type(replaceValue) == "string" and replaceValue or replaceValue(nil, searchValue, startPos - 1, source)
        local after = sub(source, endPos + 1)
        return (before .. replacement) .. after
    end
end

local __TS__StringSplit
do
    local sub = string.sub
    local find = string.find
    function __TS__StringSplit(source, separator, limit)
        if limit == nil then
            limit = 4294967295
        end
        if limit == 0 then
            return {}
        end
        local result = {}
        local resultIndex = 1
        if separator == nil or separator == "" then
            for i = 1, #source do
                result[resultIndex] = sub(source, i, i)
                resultIndex = resultIndex + 1
            end
        else
            local currentPos = 1
            while resultIndex <= limit do
                local startPos, endPos = find(source, separator, currentPos, true)
                if not startPos then
                    break
                end
                result[resultIndex] = sub(source, currentPos, startPos - 1)
                resultIndex = resultIndex + 1
                currentPos = endPos + 1
            end
            if resultIndex <= limit then
                result[resultIndex] = sub(source, currentPos)
            end
        end
        return result
    end
end

local __TS__StringReplaceAll
do
    local sub = string.sub
    local find = string.find
    function __TS__StringReplaceAll(source, searchValue, replaceValue)
        if type(replaceValue) == "string" then
            local concat = table.concat(
                __TS__StringSplit(source, searchValue),
                replaceValue
            )
            if #searchValue == 0 then
                return (replaceValue .. concat) .. replaceValue
            end
            return concat
        end
        local parts = {}
        local partsIndex = 1
        if #searchValue == 0 then
            parts[1] = replaceValue(nil, "", 0, source)
            partsIndex = 2
            for i = 1, #source do
                parts[partsIndex] = sub(source, i, i)
                parts[partsIndex + 1] = replaceValue(nil, "", i, source)
                partsIndex = partsIndex + 2
            end
        else
            local currentPos = 1
            while true do
                local startPos, endPos = find(source, searchValue, currentPos, true)
                if not startPos then
                    break
                end
                parts[partsIndex] = sub(source, currentPos, startPos - 1)
                parts[partsIndex + 1] = replaceValue(nil, searchValue, startPos - 1, source)
                partsIndex = partsIndex + 2
                currentPos = endPos + 1
            end
            parts[partsIndex] = sub(source, currentPos)
        end
        return table.concat(parts)
    end
end

local function __TS__StringSlice(self, start, ____end)
    if start == nil or start ~= start then
        start = 0
    end
    if ____end ~= ____end then
        ____end = 0
    end
    if start >= 0 then
        start = start + 1
    end
    if ____end ~= nil and ____end < 0 then
        ____end = ____end - 1
    end
    return string.sub(self, start, ____end)
end

local function __TS__StringStartsWith(self, searchString, position)
    if position == nil or position < 0 then
        position = 0
    end
    return string.sub(self, position + 1, #searchString + position) == searchString
end

local function __TS__StringSubstr(self, from, length)
    if from ~= from then
        from = 0
    end
    if length ~= nil then
        if length ~= length or length <= 0 then
            return ""
        end
        length = length + from
    end
    if from >= 0 then
        from = from + 1
    end
    return string.sub(self, from, length)
end

local function __TS__StringTrim(self)
    local result = string.gsub(self, "^[%s ﻿]*(.-)[%s ﻿]*$", "%1")
    return result
end

local function __TS__StringTrimEnd(self)
    local result = string.gsub(self, "[%s ﻿]*$", "")
    return result
end

local function __TS__StringTrimStart(self)
    local result = string.gsub(self, "^[%s ﻿]*", "")
    return result
end

local __TS__SymbolRegistryFor, __TS__SymbolRegistryKeyFor
do
    local symbolRegistry = {}
    function __TS__SymbolRegistryFor(key)
        if not symbolRegistry[key] then
            symbolRegistry[key] = __TS__Symbol(key)
        end
        return symbolRegistry[key]
    end
    function __TS__SymbolRegistryKeyFor(sym)
        for key in pairs(symbolRegistry) do
            if symbolRegistry[key] == sym then
                return key
            end
        end
        return nil
    end
end

local function __TS__TypeOf(value)
    local luaType = type(value)
    if luaType == "table" then
        return "object"
    elseif luaType == "nil" then
        return "undefined"
    else
        return luaType
    end
end

local function __TS__Using(self, cb, ...)
    local args = {...}
    local thrownError
    local ok, result = xpcall(
        function() return cb(
            nil,
            __TS__Unpack(args)
        ) end,
        function(err)
            thrownError = err
            return thrownError
        end
    )
    local argArray = {__TS__Unpack(args)}
    do
        local i = #argArray - 1
        while i >= 0 do
            local ____self_0 = argArray[i + 1]
            ____self_0[Symbol.dispose](____self_0)
            i = i - 1
        end
    end
    if not ok then
        error(thrownError, 0)
    end
    return result
end

local function __TS__UsingAsync(self, cb, ...)
    local args = {...}
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        local thrownError
        local ok, result = xpcall(
            function() return cb(
                nil,
                __TS__Unpack(args)
            ) end,
            function(err)
                thrownError = err
                return thrownError
            end
        )
        local argArray = {__TS__Unpack(args)}
        do
            local i = #argArray - 1
            while i >= 0 do
                if argArray[i + 1][Symbol.dispose] ~= nil then
                    local ____self_0 = argArray[i + 1]
                    ____self_0[Symbol.dispose](____self_0)
                end
                if argArray[i + 1][Symbol.asyncDispose] ~= nil then
                    local ____self_1 = argArray[i + 1]
                    __TS__Await(____self_1[Symbol.asyncDispose](____self_1))
                end
                i = i - 1
            end
        end
        if not ok then
            error(thrownError, 0)
        end
        return ____awaiter_resolve(nil, result)
    end)
end

return {
  __TS__ArrayAt = __TS__ArrayAt,
  __TS__ArrayConcat = __TS__ArrayConcat,
  __TS__ArrayEntries = __TS__ArrayEntries,
  __TS__ArrayEvery = __TS__ArrayEvery,
  __TS__ArrayFill = __TS__ArrayFill,
  __TS__ArrayFilter = __TS__ArrayFilter,
  __TS__ArrayForEach = __TS__ArrayForEach,
  __TS__ArrayFind = __TS__ArrayFind,
  __TS__ArrayFindIndex = __TS__ArrayFindIndex,
  __TS__ArrayFrom = __TS__ArrayFrom,
  __TS__ArrayIncludes = __TS__ArrayIncludes,
  __TS__ArrayIndexOf = __TS__ArrayIndexOf,
  __TS__ArrayIsArray = __TS__ArrayIsArray,
  __TS__ArrayJoin = __TS__ArrayJoin,
  __TS__ArrayMap = __TS__ArrayMap,
  __TS__ArrayPush = __TS__ArrayPush,
  __TS__ArrayPushArray = __TS__ArrayPushArray,
  __TS__ArrayReduce = __TS__ArrayReduce,
  __TS__ArrayReduceRight = __TS__ArrayReduceRight,
  __TS__ArrayReverse = __TS__ArrayReverse,
  __TS__ArrayUnshift = __TS__ArrayUnshift,
  __TS__ArraySort = __TS__ArraySort,
  __TS__ArraySlice = __TS__ArraySlice,
  __TS__ArraySome = __TS__ArraySome,
  __TS__ArraySplice = __TS__ArraySplice,
  __TS__ArrayToObject = __TS__ArrayToObject,
  __TS__ArrayFlat = __TS__ArrayFlat,
  __TS__ArrayFlatMap = __TS__ArrayFlatMap,
  __TS__ArraySetLength = __TS__ArraySetLength,
  __TS__ArrayToReversed = __TS__ArrayToReversed,
  __TS__ArrayToSorted = __TS__ArrayToSorted,
  __TS__ArrayToSpliced = __TS__ArrayToSpliced,
  __TS__ArrayWith = __TS__ArrayWith,
  __TS__AsyncAwaiter = __TS__AsyncAwaiter,
  __TS__Await = __TS__Await,
  __TS__Class = __TS__Class,
  __TS__ClassExtends = __TS__ClassExtends,
  __TS__CloneDescriptor = __TS__CloneDescriptor,
  __TS__CountVarargs = __TS__CountVarargs,
  __TS__Decorate = __TS__Decorate,
  __TS__DecorateLegacy = __TS__DecorateLegacy,
  __TS__DecorateParam = __TS__DecorateParam,
  __TS__Delete = __TS__Delete,
  __TS__DelegatedYield = __TS__DelegatedYield,
  Error = Error,
  RangeError = RangeError,
  ReferenceError = ReferenceError,
  SyntaxError = SyntaxError,
  TypeError = TypeError,
  URIError = URIError,
  __TS__FunctionBind = __TS__FunctionBind,
  __TS__Generator = __TS__Generator,
  __TS__InstanceOf = __TS__InstanceOf,
  __TS__InstanceOfObject = __TS__InstanceOfObject,
  __TS__Iterator = __TS__Iterator,
  __TS__LuaIteratorSpread = __TS__LuaIteratorSpread,
  Map = Map,
  __TS__Match = __TS__Match,
  __TS__MathAtan2 = __TS__MathAtan2,
  __TS__MathModf = __TS__MathModf,
  __TS__MathSign = __TS__MathSign,
  __TS__New = __TS__New,
  __TS__Number = __TS__Number,
  __TS__NumberIsFinite = __TS__NumberIsFinite,
  __TS__NumberIsInteger = __TS__NumberIsInteger,
  __TS__NumberIsNaN = __TS__NumberIsNaN,
  __TS__ParseInt = __TS__ParseInt,
  __TS__ParseFloat = __TS__ParseFloat,
  __TS__NumberToString = __TS__NumberToString,
  __TS__NumberToFixed = __TS__NumberToFixed,
  __TS__ObjectAssign = __TS__ObjectAssign,
  __TS__ObjectDefineProperty = __TS__ObjectDefineProperty,
  __TS__ObjectEntries = __TS__ObjectEntries,
  __TS__ObjectFromEntries = __TS__ObjectFromEntries,
  __TS__ObjectGetOwnPropertyDescriptor = __TS__ObjectGetOwnPropertyDescriptor,
  __TS__ObjectGetOwnPropertyDescriptors = __TS__ObjectGetOwnPropertyDescriptors,
  __TS__ObjectKeys = __TS__ObjectKeys,
  __TS__ObjectRest = __TS__ObjectRest,
  __TS__ObjectValues = __TS__ObjectValues,
  __TS__ParseFloat = __TS__ParseFloat,
  __TS__ParseInt = __TS__ParseInt,
  __TS__Promise = __TS__Promise,
  __TS__PromiseAll = __TS__PromiseAll,
  __TS__PromiseAllSettled = __TS__PromiseAllSettled,
  __TS__PromiseAny = __TS__PromiseAny,
  __TS__PromiseRace = __TS__PromiseRace,
  Set = Set,
  __TS__SetDescriptor = __TS__SetDescriptor,
  __TS__SparseArrayNew = __TS__SparseArrayNew,
  __TS__SparseArrayPush = __TS__SparseArrayPush,
  __TS__SparseArraySpread = __TS__SparseArraySpread,
  WeakMap = WeakMap,
  WeakSet = WeakSet,
  __TS__SourceMapTraceBack = __TS__SourceMapTraceBack,
  __TS__Spread = __TS__Spread,
  __TS__StringAccess = __TS__StringAccess,
  __TS__StringCharAt = __TS__StringCharAt,
  __TS__StringCharCodeAt = __TS__StringCharCodeAt,
  __TS__StringEndsWith = __TS__StringEndsWith,
  __TS__StringIncludes = __TS__StringIncludes,
  __TS__StringPadEnd = __TS__StringPadEnd,
  __TS__StringPadStart = __TS__StringPadStart,
  __TS__StringReplace = __TS__StringReplace,
  __TS__StringReplaceAll = __TS__StringReplaceAll,
  __TS__StringSlice = __TS__StringSlice,
  __TS__StringSplit = __TS__StringSplit,
  __TS__StringStartsWith = __TS__StringStartsWith,
  __TS__StringSubstr = __TS__StringSubstr,
  __TS__StringSubstring = __TS__StringSubstring,
  __TS__StringTrim = __TS__StringTrim,
  __TS__StringTrimEnd = __TS__StringTrimEnd,
  __TS__StringTrimStart = __TS__StringTrimStart,
  __TS__Symbol = __TS__Symbol,
  Symbol = Symbol,
  __TS__SymbolRegistryFor = __TS__SymbolRegistryFor,
  __TS__SymbolRegistryKeyFor = __TS__SymbolRegistryKeyFor,
  __TS__TypeOf = __TS__TypeOf,
  __TS__Unpack = __TS__Unpack,
  __TS__Using = __TS__Using,
  __TS__UsingAsync = __TS__UsingAsync
}
 end,
["app"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
local ____tslua_2Dhttp_2Dapi = require("lua_modules.@flying-dice.tslua-http-api.dist.index")
local Application = ____tslua_2Dhttp_2Dapi.Application
local base64 = require("lua_modules.@flying-dice.tslua-base64.index")
____exports.app = __TS__New(Application, "127.0.0.1", 16658)
____exports.app:post(
    "/dostring_in",
    function(____, req, res)
        if type(req.body) ~= "string" then
            res:status(400):json({error = "invalid body, should be base64 encoded lua string"})
            return
        end
        local str = base64.decode(req.body)
        local result = net.dostring_in(str)
        res:json(result)
    end
)
return ____exports
 end,
["lua_modules.@flying-dice.tslua-base64.index"] = function(...) 
--[[
 base64 -- v1.5.3 public domain Lua base64 encoder/decoder
 no warranty implied; use at your own risk
 Needs bit32.extract function. If not present it's implemented using BitOp
 or Lua 5.3 native bit operators. For Lua 5.1 fallbacks to pure Lua
 implementation inspired by Rici Lake's post:
   http://ricilake.blogspot.co.uk/2007/10/iterating-bits-in-lua.html
 author: Ilya Kolbin (iskolbin@gmail.com)
 url: github.com/iskolbin/lbase64
 COMPATIBILITY
 Lua 5.1+, LuaJIT
 LICENSE
 See end of file for license information.
--]]

local base64 = {}

local extract = _G.bit32 and _G.bit32.extract -- Lua 5.2/Lua 5.3 in compatibility mode
if not extract then
    if _G.bit then
        -- LuaJIT
        local shl, shr, band = _G.bit.lshift, _G.bit.rshift, _G.bit.band
        extract = function(v, from, width)
            return band(shr(v, from), shl(1, width) - 1)
        end
    elseif _G._VERSION == "Lua 5.1" then
        extract = function(v, from, width)
            local w = 0
            local flag = 2 ^ from
            for i = 0, width - 1 do
                local flag2 = flag + flag
                if v % flag2 >= flag then
                    w = w + 2 ^ i
                end
                flag = flag2
            end
            return w
        end
    else
        -- Lua 5.3+
        extract = load [[return function( v, from, width )
			return ( v >> from ) & ((1 << width) - 1)
		end]]()
    end
end

function base64.makeencoder(s62, s63, spad)
    local encoder = {}
    for b64code, char in pairs { [0] = 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
                                 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y',
                                 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
                                 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2',
                                 '3', '4', '5', '6', '7', '8', '9', s62 or '+', s63 or '/', spad or '=' } do
        encoder[b64code] = char:byte()
    end
    return encoder
end

function base64.makedecoder(s62, s63, spad)
    local decoder = {}
    for b64code, charcode in pairs(base64.makeencoder(s62, s63, spad)) do
        decoder[charcode] = b64code
    end
    return decoder
end

local DEFAULT_ENCODER = base64.makeencoder()
local DEFAULT_DECODER = base64.makedecoder()

local char, concat = string.char, table.concat

function base64.encode(str, encoder, usecaching)
    encoder = encoder or DEFAULT_ENCODER
    local t, k, n = {}, 1, #str
    local lastn = n % 3
    local cache = {}
    for i = 1, n - lastn, 3 do
        local a, b, c = str:byte(i, i + 2)
        local v = a * 0x10000 + b * 0x100 + c
        local s
        if usecaching then
            s = cache[v]
            if not s then
                s = char(encoder[extract(v, 18, 6)], encoder[extract(v, 12, 6)], encoder[extract(v, 6, 6)], encoder[extract(v, 0, 6)])
                cache[v] = s
            end
        else
            s = char(encoder[extract(v, 18, 6)], encoder[extract(v, 12, 6)], encoder[extract(v, 6, 6)], encoder[extract(v, 0, 6)])
        end
        t[k] = s
        k = k + 1
    end
    if lastn == 2 then
        local a, b = str:byte(n - 1, n)
        local v = a * 0x10000 + b * 0x100
        t[k] = char(encoder[extract(v, 18, 6)], encoder[extract(v, 12, 6)], encoder[extract(v, 6, 6)], encoder[64])
    elseif lastn == 1 then
        local v = str:byte(n) * 0x10000
        t[k] = char(encoder[extract(v, 18, 6)], encoder[extract(v, 12, 6)], encoder[64], encoder[64])
    end
    return concat(t)
end

function base64.decode(b64, decoder, usecaching)
    decoder = decoder or DEFAULT_DECODER
    local pattern = '[^%w%+%/%=]'
    if decoder then
        local s62, s63
        for charcode, b64code in pairs(decoder) do
            if b64code == 62 then
                s62 = charcode
            elseif b64code == 63 then
                s63 = charcode
            end
        end
        pattern = ('[^%%w%%%s%%%s%%=]'):format(char(s62), char(s63))
    end
    b64 = b64:gsub(pattern, '')
    local cache = usecaching and {}
    local t, k = {}, 1
    local n = #b64
    local padding = b64:sub(-2) == '==' and 2 or b64:sub(-1) == '=' and 1 or 0
    for i = 1, padding > 0 and n - 4 or n, 4 do
        local a, b, c, d = b64:byte(i, i + 3)
        local s
        if usecaching then
            local v0 = a * 0x1000000 + b * 0x10000 + c * 0x100 + d
            s = cache[v0]
            if not s then
                local v = decoder[a] * 0x40000 + decoder[b] * 0x1000 + decoder[c] * 0x40 + decoder[d]
                s = char(extract(v, 16, 8), extract(v, 8, 8), extract(v, 0, 8))
                cache[v0] = s
            end
        else
            local v = decoder[a] * 0x40000 + decoder[b] * 0x1000 + decoder[c] * 0x40 + decoder[d]
            s = char(extract(v, 16, 8), extract(v, 8, 8), extract(v, 0, 8))
        end
        t[k] = s
        k = k + 1
    end
    if padding == 1 then
        local a, b, c = b64:byte(n - 3, n - 1)
        local v = decoder[a] * 0x40000 + decoder[b] * 0x1000 + decoder[c] * 0x40
        t[k] = char(extract(v, 16, 8), extract(v, 8, 8))
    elseif padding == 2 then
        local a, b = b64:byte(n - 3, n - 2)
        local v = decoder[a] * 0x40000 + decoder[b] * 0x1000
        t[k] = char(extract(v, 16, 8))
    end
    return concat(t)
end

return base64 end,
["lua_modules.@flying-dice.tslua-http-api.dist.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1});
local ____exports = {}
do
    local ____export = require("lua_modules.@flying-dice.tslua-http-api.dist.application")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-http-api.dist.application"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["16"] = 1,["17"] = 1,["18"] = 2,["19"] = 5,["20"] = 6,["21"] = 7,["22"] = 9,["23"] = 10,["24"] = 10,["25"] = 10,["26"] = 12,["27"] = 12,["28"] = 12,["29"] = 15,["30"] = 15,["31"] = 13,["32"] = 15,["33"] = 17,["34"] = 18,["35"] = 19,["36"] = 17,["37"] = 22,["38"] = 23,["39"] = 24,["40"] = 25,["41"] = 22,["42"] = 28,["43"] = 29,["44"] = 30,["45"] = 31,["46"] = 28,["48"] = 50,["49"] = 50,["50"] = 50,["51"] = 50,["52"] = 66,["53"] = 50,["54"] = 67,["55"] = 67,["56"] = 67,["57"] = 67,["58"] = 67,["59"] = 70,["60"] = 71,["61"] = 72,["62"] = 73,["63"] = 72,["64"] = 66,["65"] = 84,["66"] = 84,["67"] = 85,["68"] = 85,["69"] = 85,["70"] = 86,["72"] = 86,["73"] = 86,["74"] = 85,["75"] = 85,["76"] = 84,["77"] = 90,["78"] = 91,["79"] = 90,["80"] = 99,["81"] = 99,["82"] = 100,["83"] = 100,["84"] = 100,["85"] = 101,["87"] = 101,["88"] = 101,["89"] = 100,["90"] = 100,["91"] = 99,["92"] = 108,["93"] = 108,["94"] = 109,["95"] = 109,["96"] = 109,["97"] = 110,["99"] = 110,["100"] = 110,["101"] = 109,["102"] = 109,["103"] = 108,["104"] = 117,["105"] = 117,["106"] = 118,["107"] = 118,["108"] = 118,["109"] = 119,["111"] = 119,["112"] = 119,["113"] = 118,["114"] = 118,["115"] = 117,["116"] = 126,["117"] = 126,["118"] = 127,["119"] = 127,["120"] = 127,["121"] = 128,["123"] = 128,["124"] = 128,["125"] = 127,["126"] = 127,["127"] = 126,["128"] = 135,["129"] = 135,["130"] = 136,["131"] = 136,["132"] = 136,["133"] = 137,["135"] = 137,["136"] = 137,["137"] = 136,["138"] = 136,["139"] = 135,["140"] = 144,["141"] = 144,["142"] = 145,["143"] = 145,["144"] = 145,["145"] = 146,["147"] = 146,["148"] = 146,["149"] = 145,["150"] = 145,["151"] = 144,["152"] = 156,["153"] = 157,["154"] = 160,["155"] = 160,["156"] = 160,["157"] = 160,["158"] = 165,["159"] = 168,["160"] = 169,["162"] = 172,["165"] = 190,["168"] = 175,["169"] = 175,["170"] = 176,["171"] = 177,["172"] = 178,["173"] = 178,["174"] = 178,["175"] = 178,["176"] = 179,["177"] = 180,["179"] = 182,["181"] = 178,["182"] = 178,["184"] = 175,["185"] = 188,["186"] = 188,["193"] = 193,["194"] = 156});
local ____exports = {}
local ____tslua_2Dcommon = require("lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-common.dist.index")
local Logger = ____tslua_2Dcommon.Logger
local ____tslua_2Dhttp = require("lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.index")
local HttpServer = ____tslua_2Dhttp.HttpServer
local HttpStatus = ____tslua_2Dhttp.HttpStatus
local StatusText = ____tslua_2Dhttp.StatusText
local json = require("lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-rxi-json.index")
local ____path = require("lua_modules.@flying-dice.tslua-http-api.dist.path")
local getPathParameters = ____path.getPathParameters
local isMatch = ____path.isMatch
____exports.AppHttpResponse = __TS__Class()
local AppHttpResponse = ____exports.AppHttpResponse
AppHttpResponse.name = "AppHttpResponse"
function AppHttpResponse.prototype.____constructor(self, res)
    self.res = res
    self.logger = __TS__New(Logger, "AppHttpResponse")
end
function AppHttpResponse.prototype.status(self, status)
    self.res.status = status
    return self
end
function AppHttpResponse.prototype.send(self, data)
    self.res.headers["Content-Type"] = "text/plain"
    self.res.body = data
    return self
end
function AppHttpResponse.prototype.json(self, value)
    self.res.headers["Content-Type"] = "application/json"
    self.res.body = json.encode(value)
    return self
end
--- A class representing a web application, extending the functionality of HttpServer.
____exports.Application = __TS__Class()
local Application = ____exports.Application
Application.name = "Application"
__TS__ClassExtends(Application, HttpServer)
function Application.prototype.____constructor(self, bindAddress, port)
    HttpServer.prototype.____constructor(
        self,
        bindAddress,
        port,
        function(____, req, res) return self:handleRequest(req, res) end
    )
    self.logger = __TS__New(Logger, ____exports.Application.name)
    self.requestHandlers = {}
    self.errorMiddleware = function(____, err, req, res)
        res:status(HttpStatus.INTERNAL_SERVER_ERROR):send(StatusText[HttpStatus.INTERNAL_SERVER_ERROR])
    end
end
function Application.prototype.use(self, route, ...)
    local middleware = {...}
    __TS__ArrayForEach(
        middleware,
        function(____, it)
            local ____self_requestHandlers_0 = self.requestHandlers
            local ____temp_1 = #____self_requestHandlers_0 + 1
            ____self_requestHandlers_0[____temp_1] = {route = route, middleware = it}
            return ____temp_1
        end
    )
end
function Application.prototype.useGlobalErrorHandler(self, middleware)
    self.errorMiddleware = middleware
end
function Application.prototype.get(self, route, ...)
    local middleware = {...}
    __TS__ArrayForEach(
        middleware,
        function(____, it)
            local ____self_requestHandlers_2 = self.requestHandlers
            local ____temp_3 = #____self_requestHandlers_2 + 1
            ____self_requestHandlers_2[____temp_3] = {route = route, middleware = it, method = "GET"}
            return ____temp_3
        end
    )
end
function Application.prototype.put(self, route, ...)
    local middleware = {...}
    __TS__ArrayForEach(
        middleware,
        function(____, it)
            local ____self_requestHandlers_4 = self.requestHandlers
            local ____temp_5 = #____self_requestHandlers_4 + 1
            ____self_requestHandlers_4[____temp_5] = {route = route, middleware = it, method = "PUT"}
            return ____temp_5
        end
    )
end
function Application.prototype.post(self, route, ...)
    local middleware = {...}
    __TS__ArrayForEach(
        middleware,
        function(____, it)
            local ____self_requestHandlers_6 = self.requestHandlers
            local ____temp_7 = #____self_requestHandlers_6 + 1
            ____self_requestHandlers_6[____temp_7] = {route = route, middleware = it, method = "POST"}
            return ____temp_7
        end
    )
end
function Application.prototype.delete(self, route, ...)
    local middleware = {...}
    __TS__ArrayForEach(
        middleware,
        function(____, it)
            local ____self_requestHandlers_8 = self.requestHandlers
            local ____temp_9 = #____self_requestHandlers_8 + 1
            ____self_requestHandlers_8[____temp_9] = {route = route, middleware = it, method = "DELETE"}
            return ____temp_9
        end
    )
end
function Application.prototype.patch(self, route, ...)
    local middleware = {...}
    __TS__ArrayForEach(
        middleware,
        function(____, it)
            local ____self_requestHandlers_10 = self.requestHandlers
            local ____temp_11 = #____self_requestHandlers_10 + 1
            ____self_requestHandlers_10[____temp_11] = {route = route, middleware = it, method = "PATCH"}
            return ____temp_11
        end
    )
end
function Application.prototype.options(self, route, ...)
    local middleware = {...}
    __TS__ArrayForEach(
        middleware,
        function(____, it)
            local ____self_requestHandlers_12 = self.requestHandlers
            local ____temp_13 = #____self_requestHandlers_12 + 1
            ____self_requestHandlers_12[____temp_13] = {route = route, middleware = it, method = "OPTIONS"}
            return ____temp_13
        end
    )
end
function Application.prototype.handleRequest(self, req, res)
    self.logger:debug("Handling Request")
    local stack = __TS__ArrayFilter(
        self.requestHandlers,
        function(____, it) return (not it.method or it.method == req.method) and isMatch(nil, it.route, req.path) end
    )
    self.logger:debug(("Found " .. tostring(#stack)) .. " handlers to process")
    if #stack > 0 then
        res.status = HttpStatus.OK
    end
    local appResponse = __TS__New(____exports.AppHttpResponse, res)
    do
        local function ____catch(e)
            self:errorMiddleware(e, req, appResponse)
        end
        local ____try, ____hasReturned = pcall(function()
            local runStackItem
            runStackItem = function(____, idx)
                if idx < #stack then
                    req.parameters = getPathParameters(nil, stack[idx + 1].route, req.path)
                    stack[idx + 1]:middleware(
                        req,
                        appResponse,
                        function(____, err)
                            if not err then
                                runStackItem(nil, idx + 1)
                            else
                                error(err, 0)
                            end
                        end
                    )
                end
            end
            if #stack > 0 then
                runStackItem(nil, 0)
            end
        end)
        if not ____try then
            ____catch(____hasReturned)
        end
    end
    return appResponse.res
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-http-api.dist.path"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 4,["12"] = 6,["13"] = 7,["14"] = 8,["15"] = 9,["16"] = 10,["17"] = 6,["18"] = 13,["19"] = 14,["20"] = 16,["21"] = 17,["22"] = 18,["23"] = 13,["24"] = 21,["25"] = 22,["26"] = 22,["27"] = 22,["28"] = 22,["29"] = 24,["30"] = 21,["31"] = 27,["32"] = 28,["33"] = 29,["34"] = 31,["35"] = 32,["36"] = 33,["38"] = 36,["39"] = 27,["40"] = 39,["41"] = 43,["42"] = 44,["43"] = 46,["44"] = 47,["45"] = 49,["46"] = 50,["47"] = 52,["48"] = 52,["49"] = 52,["50"] = 53,["51"] = 57,["52"] = 58,["54"] = 52,["55"] = 52,["56"] = 62,["57"] = 39,["58"] = 65,["59"] = 66,["60"] = 67,["61"] = 68,["62"] = 69,["63"] = 65});
local ____exports = {}
local ____tslua_2Dcommon = require("lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-common.dist.index")
local Logger = ____tslua_2Dcommon.Logger
local ____externals = require("lua_modules.@flying-dice.tslua-http-api.dist.externals")
local _string = ____externals._string
local logger = __TS__New(Logger, "Path")
____exports.gSubPathParamsToPattern = function(____, route)
    logger:debug("Replacing Path Params for Pattern matcher " .. route)
    local result = {_string.gsub(route, ":[%w_]+", "([%%w_]+)")}
    logger:debug("Replaced Path Params for Pattern matcher " .. result[1])
    return result[1]
end
____exports.gSubEscapeReservedChars = function(____, route)
    logger:debug("Escaping Path matcher " .. route)
    local patternRoute = _string.gsub(route, "([%(%)%%%+%-%?%[%^%$])", "%%%1")
    logger:debug("Escaping Path matcher " .. patternRoute)
    return patternRoute
end
____exports.routeToPattern = function(____, route)
    local patternRoute = ____exports.gSubPathParamsToPattern(
        nil,
        ____exports.gSubEscapeReservedChars(nil, route)
    )
    return ("^" .. patternRoute) .. "$"
end
____exports.getParamNames = function(____, route)
    logger:debug("Getting Param names from " .. route)
    local names = {}
    for name in _string.gmatch(route, ":(%w+)") do
        logger:debug(("Adding " .. name) .. " to params array")
        names[#names + 1] = name
    end
    return names
end
____exports.getPathParameters = function(____, route, path)
    logger:debug("Getting Param names")
    local paramNames = ____exports.getParamNames(nil, route)
    logger:debug("Getting Route Pattern")
    local pattern = ____exports.routeToPattern(nil, route)
    logger:debug("Assembling Parameters")
    local matches = {}
    __TS__ArrayForEach(
        {_string.match(path, pattern)},
        function(____, match, idx)
            logger:debug((("Adding Parameter " .. (paramNames[idx + 1] or "nil")) .. " from match ") .. match)
            if paramNames[idx + 1] then
                matches[paramNames[idx + 1]] = match
            end
        end
    )
    return matches
end
____exports.isMatch = function(____, route, path)
    local pattern = ____exports.routeToPattern(nil, route)
    logger:debug(((("checking if \"" .. pattern) .. "\" matches \"") .. path) .. "\"")
    local res = {_string.match(path, pattern)}
    return (res and res[1]) ~= nil
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-http-api.dist.externals"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1});
local ____exports = {}
____exports._string = {gsub = string.gsub, match = string.match, gmatch = string.gmatch}
return ____exports
 end,
["lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-common.dist.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1});
local ____exports = {}
do
    local ____export = require("lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-common.dist.logger")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-common.dist.logger"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 7,["8"] = 7,["9"] = 7,["10"] = 8,["11"] = 8,["12"] = 8,["13"] = 17,["14"] = 18,["15"] = 17,["16"] = 28,["17"] = 29,["18"] = 28,["19"] = 39,["20"] = 40,["21"] = 39,["22"] = 50,["23"] = 51,["24"] = 50});
local ____exports = {}
--- Represents a logger that can be used to log messages with different severity levels.
____exports.Logger = __TS__Class()
local Logger = ____exports.Logger
Logger.name = "Logger"
function Logger.prototype.____constructor(self, name)
    self.name = name
end
function Logger.prototype.debug(self, message)
    print((("[DEBUG] [" .. self.name) .. "] - ") .. message)
end
function Logger.prototype.info(self, message)
    print((("[INFO] [" .. self.name) .. "] - ") .. message)
end
function Logger.prototype.warn(self, message)
    print((("[WARN] [" .. self.name) .. "] - ") .. message)
end
function Logger.prototype.error(self, message)
    print((("[ERROR] [" .. self.name) .. "] - ") .. message)
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-rxi-json.index"] = function(...) 
--
-- json.lua
--
-- Copyright (c) 2020 rxi
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of
-- this software and associated documentation files (the "Software"), to deal in
-- the Software without restriction, including without limitation the rights to
-- use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
-- of the Software, and to permit persons to whom the Software is furnished to do
-- so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--

local json = { _version = "0.1.2" }

-------------------------------------------------------------------------------
-- Encode
-------------------------------------------------------------------------------

local encode

local escape_char_map = {
    [ "\\" ] = "\\",
    [ "\"" ] = "\"",
    [ "\b" ] = "b",
    [ "\f" ] = "f",
    [ "\n" ] = "n",
    [ "\r" ] = "r",
    [ "\t" ] = "t",
}

local escape_char_map_inv = { [ "/" ] = "/" }
for k, v in pairs(escape_char_map) do
    escape_char_map_inv[v] = k
end


local function escape_char(c)
    return "\\" .. (escape_char_map[c] or string.format("u%04x", c:byte()))
end


local function encode_nil(val)
    return "null"
end


local function encode_table(val, stack)
    local res = {}
    stack = stack or {}

    -- Circular reference?
    if stack[val] then error("circular reference") end

    stack[val] = true

    if rawget(val, 1) ~= nil or next(val) == nil then
        -- Treat as array -- check keys are valid and it is not sparse
        local n = 0
        for k in pairs(val) do
            if type(k) ~= "number" then
                error("invalid table: mixed or invalid key types")
            end
            n = n + 1
        end
        if n ~= #val then
            error("invalid table: sparse array")
        end
        -- Encode
        for i, v in ipairs(val) do
            table.insert(res, encode(v, stack))
        end
        stack[val] = nil
        return "[" .. table.concat(res, ",") .. "]"

    else
        -- Treat as an object
        for k, v in pairs(val) do
            if type(k) ~= "string" then
                error("invalid table: mixed or invalid key types")
            end
            table.insert(res, encode(k, stack) .. ":" .. encode(v, stack))
        end
        stack[val] = nil
        return "{" .. table.concat(res, ",") .. "}"
    end
end


local function encode_string(val)
    return '"' .. val:gsub('[%z\1-\31\\"]', escape_char) .. '"'
end


local function encode_number(val)
    -- Check for NaN, -inf and inf
    if val ~= val or val <= -math.huge or val >= math.huge then
        error("unexpected number value '" .. tostring(val) .. "'")
    end
    return string.format("%.14g", val)
end


local type_func_map = {
    [ "nil"     ] = encode_nil,
    [ "table"   ] = encode_table,
    [ "string"  ] = encode_string,
    [ "number"  ] = encode_number,
    [ "boolean" ] = tostring,
}


encode = function(val, stack)
    local t = type(val)
    local f = type_func_map[t]
    if f then
        return f(val, stack)
    end
    error("unexpected type '" .. t .. "'")
end


function json.encode(val)
    return ( encode(val) )
end


-------------------------------------------------------------------------------
-- Decode
-------------------------------------------------------------------------------

local parse

local function create_set(...)
    local res = {}
    for i = 1, select("#", ...) do
        res[ select(i, ...) ] = true
    end
    return res
end

local space_chars   = create_set(" ", "\t", "\r", "\n")
local delim_chars   = create_set(" ", "\t", "\r", "\n", "]", "}", ",")
local escape_chars  = create_set("\\", "/", '"', "b", "f", "n", "r", "t", "u")
local literals      = create_set("true", "false", "null")

local literal_map = {
    [ "true"  ] = true,
    [ "false" ] = false,
    [ "null"  ] = nil,
}


local function next_char(str, idx, set, negate)
    for i = idx, #str do
        if set[str:sub(i, i)] ~= negate then
            return i
        end
    end
    return #str + 1
end


local function decode_error(str, idx, msg)
    local line_count = 1
    local col_count = 1
    for i = 1, idx - 1 do
        col_count = col_count + 1
        if str:sub(i, i) == "\n" then
            line_count = line_count + 1
            col_count = 1
        end
    end
    error( string.format("%s at line %d col %d", msg, line_count, col_count) )
end


local function codepoint_to_utf8(n)
    -- http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=iws-appendixa
    local f = math.floor
    if n <= 0x7f then
        return string.char(n)
    elseif n <= 0x7ff then
        return string.char(f(n / 64) + 192, n % 64 + 128)
    elseif n <= 0xffff then
        return string.char(f(n / 4096) + 224, f(n % 4096 / 64) + 128, n % 64 + 128)
    elseif n <= 0x10ffff then
        return string.char(f(n / 262144) + 240, f(n % 262144 / 4096) + 128,
                f(n % 4096 / 64) + 128, n % 64 + 128)
    end
    error( string.format("invalid unicode codepoint '%x'", n) )
end


local function parse_unicode_escape(s)
    local n1 = tonumber( s:sub(1, 4),  16 )
    local n2 = tonumber( s:sub(7, 10), 16 )
    -- Surrogate pair?
    if n2 then
        return codepoint_to_utf8((n1 - 0xd800) * 0x400 + (n2 - 0xdc00) + 0x10000)
    else
        return codepoint_to_utf8(n1)
    end
end


local function parse_string(str, i)
    local res = ""
    local j = i + 1
    local k = j

    while j <= #str do
        local x = str:byte(j)

        if x < 32 then
            decode_error(str, j, "control character in string")

        elseif x == 92 then -- `\`: Escape
            res = res .. str:sub(k, j - 1)
            j = j + 1
            local c = str:sub(j, j)
            if c == "u" then
                local hex = str:match("^[dD][89aAbB]%x%x\\u%x%x%x%x", j + 1)
                        or str:match("^%x%x%x%x", j + 1)
                        or decode_error(str, j - 1, "invalid unicode escape in string")
                res = res .. parse_unicode_escape(hex)
                j = j + #hex
            else
                if not escape_chars[c] then
                    decode_error(str, j - 1, "invalid escape char '" .. c .. "' in string")
                end
                res = res .. escape_char_map_inv[c]
            end
            k = j + 1

        elseif x == 34 then -- `"`: End of string
            res = res .. str:sub(k, j - 1)
            return res, j + 1
        end

        j = j + 1
    end

    decode_error(str, i, "expected closing quote for string")
end


local function parse_number(str, i)
    local x = next_char(str, i, delim_chars)
    local s = str:sub(i, x - 1)
    local n = tonumber(s)
    if not n then
        decode_error(str, i, "invalid number '" .. s .. "'")
    end
    return n, x
end


local function parse_literal(str, i)
    local x = next_char(str, i, delim_chars)
    local word = str:sub(i, x - 1)
    if not literals[word] then
        decode_error(str, i, "invalid literal '" .. word .. "'")
    end
    return literal_map[word], x
end


local function parse_array(str, i)
    local res = {}
    local n = 1
    i = i + 1
    while 1 do
        local x
        i = next_char(str, i, space_chars, true)
        -- Empty / end of array?
        if str:sub(i, i) == "]" then
            i = i + 1
            break
        end
        -- Read token
        x, i = parse(str, i)
        res[n] = x
        n = n + 1
        -- Next token
        i = next_char(str, i, space_chars, true)
        local chr = str:sub(i, i)
        i = i + 1
        if chr == "]" then break end
        if chr ~= "," then decode_error(str, i, "expected ']' or ','") end
    end
    return res, i
end


local function parse_object(str, i)
    local res = {}
    i = i + 1
    while 1 do
        local key, val
        i = next_char(str, i, space_chars, true)
        -- Empty / end of object?
        if str:sub(i, i) == "}" then
            i = i + 1
            break
        end
        -- Read key
        if str:sub(i, i) ~= '"' then
            decode_error(str, i, "expected string for key")
        end
        key, i = parse(str, i)
        -- Read ':' delimiter
        i = next_char(str, i, space_chars, true)
        if str:sub(i, i) ~= ":" then
            decode_error(str, i, "expected ':' after key")
        end
        i = next_char(str, i + 1, space_chars, true)
        -- Read value
        val, i = parse(str, i)
        -- Set
        res[key] = val
        -- Next token
        i = next_char(str, i, space_chars, true)
        local chr = str:sub(i, i)
        i = i + 1
        if chr == "}" then break end
        if chr ~= "," then decode_error(str, i, "expected '}' or ','") end
    end
    return res, i
end


local char_func_map = {
    [ '"' ] = parse_string,
    [ "0" ] = parse_number,
    [ "1" ] = parse_number,
    [ "2" ] = parse_number,
    [ "3" ] = parse_number,
    [ "4" ] = parse_number,
    [ "5" ] = parse_number,
    [ "6" ] = parse_number,
    [ "7" ] = parse_number,
    [ "8" ] = parse_number,
    [ "9" ] = parse_number,
    [ "-" ] = parse_number,
    [ "t" ] = parse_literal,
    [ "f" ] = parse_literal,
    [ "n" ] = parse_literal,
    [ "[" ] = parse_array,
    [ "{" ] = parse_object,
}


parse = function(str, idx)
    local chr = str:sub(idx, idx)
    local f = char_func_map[chr]
    if f then
        return f(str, idx)
    end
    decode_error(str, idx, "unexpected character '" .. chr .. "'")
end


function json.decode(str)
    if type(str) ~= "string" then
        error("expected argument of type string, got " .. type(str))
    end
    local res, idx = parse(str, next_char(str, 1, space_chars, true))
    idx = next_char(str, idx, space_chars, true)
    if idx <= #str then
        decode_error(str, idx, "trailing garbage")
    end
    return res
end


return json end,
["lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["14"] = 2,["15"] = 2,["16"] = 2,["17"] = 2,["18"] = 2});
local ____exports = {}
do
    local ____export = require("lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.server")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____constants = require("lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.constants")
    local HttpStatus = ____constants.HttpStatus
    local StatusText = ____constants.StatusText
    ____exports.HttpStatus = HttpStatus
    ____exports.StatusText = StatusText
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.constants"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 2,["7"] = 5,["8"] = 11,["9"] = 11,["10"] = 17,["11"] = 17,["12"] = 23,["13"] = 23,["14"] = 29,["15"] = 29,["16"] = 39,["17"] = 39,["18"] = 45,["19"] = 45,["20"] = 51,["21"] = 51,["22"] = 57,["23"] = 57,["24"] = 63,["25"] = 63,["26"] = 69,["27"] = 69,["28"] = 75,["29"] = 75,["30"] = 81,["31"] = 81,["32"] = 87,["33"] = 87,["34"] = 93,["35"] = 93,["36"] = 99,["37"] = 99,["38"] = 105,["39"] = 105,["40"] = 111,["41"] = 111,["42"] = 118,["43"] = 118,["44"] = 124,["45"] = 124,["46"] = 130,["47"] = 130,["48"] = 136,["49"] = 136,["50"] = 142,["51"] = 142,["52"] = 148,["53"] = 148,["54"] = 154,["55"] = 154,["56"] = 160,["57"] = 160,["58"] = 166,["59"] = 166,["60"] = 172,["61"] = 172,["62"] = 178,["63"] = 178,["64"] = 184,["65"] = 184,["66"] = 190,["67"] = 190,["68"] = 196,["69"] = 196,["70"] = 202,["71"] = 202,["72"] = 208,["73"] = 208,["74"] = 214,["75"] = 214,["76"] = 220,["77"] = 220,["78"] = 226,["79"] = 226,["80"] = 232,["81"] = 232,["82"] = 238,["83"] = 238,["84"] = 244,["85"] = 244,["86"] = 250,["87"] = 250,["88"] = 257,["89"] = 257,["90"] = 263,["91"] = 263,["92"] = 269,["93"] = 269,["94"] = 275,["95"] = 275,["96"] = 281,["97"] = 281,["98"] = 287,["99"] = 287,["100"] = 293,["101"] = 293,["102"] = 299,["103"] = 299,["104"] = 305,["105"] = 305,["106"] = 311,["107"] = 311,["108"] = 317,["109"] = 317,["110"] = 323,["111"] = 323,["112"] = 329,["113"] = 329,["114"] = 335,["115"] = 335,["116"] = 341,["117"] = 341,["118"] = 347,["119"] = 347,["120"] = 353,["121"] = 353,["122"] = 359,["123"] = 359,["124"] = 362,["125"] = 362,["126"] = 362,["127"] = 362,["128"] = 362,["129"] = 362,["130"] = 362,["131"] = 362,["132"] = 362,["133"] = 362,["134"] = 362,["135"] = 362,["136"] = 362,["137"] = 362,["138"] = 362,["139"] = 362,["140"] = 362,["141"] = 362,["142"] = 362,["143"] = 362,["144"] = 362,["145"] = 362,["146"] = 362,["147"] = 362,["148"] = 362,["149"] = 362,["150"] = 362,["151"] = 362,["152"] = 362,["153"] = 362,["154"] = 362,["155"] = 362,["156"] = 362,["157"] = 362,["158"] = 362,["159"] = 362,["160"] = 362,["161"] = 362,["162"] = 362,["163"] = 362,["164"] = 362,["165"] = 362,["166"] = 362,["167"] = 362,["168"] = 362,["169"] = 362,["170"] = 362,["171"] = 362,["172"] = 362,["173"] = 362,["174"] = 362,["175"] = 362,["176"] = 362,["177"] = 362,["178"] = 362,["179"] = 362,["180"] = 362,["181"] = 362,["182"] = 362,["183"] = 362});
local ____exports = {}
____exports.EMPTY_LINE = ""
____exports.CRLF = "\r\n"
____exports.HttpStatus = HttpStatus or ({})
____exports.HttpStatus.CONTINUE = 100
____exports.HttpStatus[____exports.HttpStatus.CONTINUE] = "CONTINUE"
____exports.HttpStatus.SWITCHING_PROTOCOLS = 101
____exports.HttpStatus[____exports.HttpStatus.SWITCHING_PROTOCOLS] = "SWITCHING_PROTOCOLS"
____exports.HttpStatus.PROCESSING = 102
____exports.HttpStatus[____exports.HttpStatus.PROCESSING] = "PROCESSING"
____exports.HttpStatus.EARLY_HINTS = 103
____exports.HttpStatus[____exports.HttpStatus.EARLY_HINTS] = "EARLY_HINTS"
____exports.HttpStatus.OK = 200
____exports.HttpStatus[____exports.HttpStatus.OK] = "OK"
____exports.HttpStatus.CREATED = 201
____exports.HttpStatus[____exports.HttpStatus.CREATED] = "CREATED"
____exports.HttpStatus.ACCEPTED = 202
____exports.HttpStatus[____exports.HttpStatus.ACCEPTED] = "ACCEPTED"
____exports.HttpStatus.NON_AUTHORITATIVE_INFORMATION = 203
____exports.HttpStatus[____exports.HttpStatus.NON_AUTHORITATIVE_INFORMATION] = "NON_AUTHORITATIVE_INFORMATION"
____exports.HttpStatus.NO_CONTENT = 204
____exports.HttpStatus[____exports.HttpStatus.NO_CONTENT] = "NO_CONTENT"
____exports.HttpStatus.RESET_CONTENT = 205
____exports.HttpStatus[____exports.HttpStatus.RESET_CONTENT] = "RESET_CONTENT"
____exports.HttpStatus.PARTIAL_CONTENT = 206
____exports.HttpStatus[____exports.HttpStatus.PARTIAL_CONTENT] = "PARTIAL_CONTENT"
____exports.HttpStatus.MULTI_STATUS = 207
____exports.HttpStatus[____exports.HttpStatus.MULTI_STATUS] = "MULTI_STATUS"
____exports.HttpStatus.MULTIPLE_CHOICES = 300
____exports.HttpStatus[____exports.HttpStatus.MULTIPLE_CHOICES] = "MULTIPLE_CHOICES"
____exports.HttpStatus.MOVED_PERMANENTLY = 301
____exports.HttpStatus[____exports.HttpStatus.MOVED_PERMANENTLY] = "MOVED_PERMANENTLY"
____exports.HttpStatus.MOVED_TEMPORARILY = 302
____exports.HttpStatus[____exports.HttpStatus.MOVED_TEMPORARILY] = "MOVED_TEMPORARILY"
____exports.HttpStatus.SEE_OTHER = 303
____exports.HttpStatus[____exports.HttpStatus.SEE_OTHER] = "SEE_OTHER"
____exports.HttpStatus.NOT_MODIFIED = 304
____exports.HttpStatus[____exports.HttpStatus.NOT_MODIFIED] = "NOT_MODIFIED"
____exports.HttpStatus.USE_PROXY = 305
____exports.HttpStatus[____exports.HttpStatus.USE_PROXY] = "USE_PROXY"
____exports.HttpStatus.TEMPORARY_REDIRECT = 307
____exports.HttpStatus[____exports.HttpStatus.TEMPORARY_REDIRECT] = "TEMPORARY_REDIRECT"
____exports.HttpStatus.PERMANENT_REDIRECT = 308
____exports.HttpStatus[____exports.HttpStatus.PERMANENT_REDIRECT] = "PERMANENT_REDIRECT"
____exports.HttpStatus.BAD_REQUEST = 400
____exports.HttpStatus[____exports.HttpStatus.BAD_REQUEST] = "BAD_REQUEST"
____exports.HttpStatus.UNAUTHORIZED = 401
____exports.HttpStatus[____exports.HttpStatus.UNAUTHORIZED] = "UNAUTHORIZED"
____exports.HttpStatus.PAYMENT_REQUIRED = 402
____exports.HttpStatus[____exports.HttpStatus.PAYMENT_REQUIRED] = "PAYMENT_REQUIRED"
____exports.HttpStatus.FORBIDDEN = 403
____exports.HttpStatus[____exports.HttpStatus.FORBIDDEN] = "FORBIDDEN"
____exports.HttpStatus.NOT_FOUND = 404
____exports.HttpStatus[____exports.HttpStatus.NOT_FOUND] = "NOT_FOUND"
____exports.HttpStatus.METHOD_NOT_ALLOWED = 405
____exports.HttpStatus[____exports.HttpStatus.METHOD_NOT_ALLOWED] = "METHOD_NOT_ALLOWED"
____exports.HttpStatus.NOT_ACCEPTABLE = 406
____exports.HttpStatus[____exports.HttpStatus.NOT_ACCEPTABLE] = "NOT_ACCEPTABLE"
____exports.HttpStatus.PROXY_AUTHENTICATION_REQUIRED = 407
____exports.HttpStatus[____exports.HttpStatus.PROXY_AUTHENTICATION_REQUIRED] = "PROXY_AUTHENTICATION_REQUIRED"
____exports.HttpStatus.REQUEST_TIMEOUT = 408
____exports.HttpStatus[____exports.HttpStatus.REQUEST_TIMEOUT] = "REQUEST_TIMEOUT"
____exports.HttpStatus.CONFLICT = 409
____exports.HttpStatus[____exports.HttpStatus.CONFLICT] = "CONFLICT"
____exports.HttpStatus.GONE = 410
____exports.HttpStatus[____exports.HttpStatus.GONE] = "GONE"
____exports.HttpStatus.LENGTH_REQUIRED = 411
____exports.HttpStatus[____exports.HttpStatus.LENGTH_REQUIRED] = "LENGTH_REQUIRED"
____exports.HttpStatus.PRECONDITION_FAILED = 412
____exports.HttpStatus[____exports.HttpStatus.PRECONDITION_FAILED] = "PRECONDITION_FAILED"
____exports.HttpStatus.REQUEST_TOO_LONG = 413
____exports.HttpStatus[____exports.HttpStatus.REQUEST_TOO_LONG] = "REQUEST_TOO_LONG"
____exports.HttpStatus.REQUEST_URI_TOO_LONG = 414
____exports.HttpStatus[____exports.HttpStatus.REQUEST_URI_TOO_LONG] = "REQUEST_URI_TOO_LONG"
____exports.HttpStatus.UNSUPPORTED_MEDIA_TYPE = 415
____exports.HttpStatus[____exports.HttpStatus.UNSUPPORTED_MEDIA_TYPE] = "UNSUPPORTED_MEDIA_TYPE"
____exports.HttpStatus.REQUESTED_RANGE_NOT_SATISFIABLE = 416
____exports.HttpStatus[____exports.HttpStatus.REQUESTED_RANGE_NOT_SATISFIABLE] = "REQUESTED_RANGE_NOT_SATISFIABLE"
____exports.HttpStatus.EXPECTATION_FAILED = 417
____exports.HttpStatus[____exports.HttpStatus.EXPECTATION_FAILED] = "EXPECTATION_FAILED"
____exports.HttpStatus.IM_A_TEAPOT = 418
____exports.HttpStatus[____exports.HttpStatus.IM_A_TEAPOT] = "IM_A_TEAPOT"
____exports.HttpStatus.INSUFFICIENT_SPACE_ON_RESOURCE = 419
____exports.HttpStatus[____exports.HttpStatus.INSUFFICIENT_SPACE_ON_RESOURCE] = "INSUFFICIENT_SPACE_ON_RESOURCE"
____exports.HttpStatus.METHOD_FAILURE = 420
____exports.HttpStatus[____exports.HttpStatus.METHOD_FAILURE] = "METHOD_FAILURE"
____exports.HttpStatus.MISDIRECTED_REQUEST = 421
____exports.HttpStatus[____exports.HttpStatus.MISDIRECTED_REQUEST] = "MISDIRECTED_REQUEST"
____exports.HttpStatus.UNPROCESSABLE_ENTITY = 422
____exports.HttpStatus[____exports.HttpStatus.UNPROCESSABLE_ENTITY] = "UNPROCESSABLE_ENTITY"
____exports.HttpStatus.LOCKED = 423
____exports.HttpStatus[____exports.HttpStatus.LOCKED] = "LOCKED"
____exports.HttpStatus.FAILED_DEPENDENCY = 424
____exports.HttpStatus[____exports.HttpStatus.FAILED_DEPENDENCY] = "FAILED_DEPENDENCY"
____exports.HttpStatus.UPGRADE_REQUIRED = 426
____exports.HttpStatus[____exports.HttpStatus.UPGRADE_REQUIRED] = "UPGRADE_REQUIRED"
____exports.HttpStatus.PRECONDITION_REQUIRED = 428
____exports.HttpStatus[____exports.HttpStatus.PRECONDITION_REQUIRED] = "PRECONDITION_REQUIRED"
____exports.HttpStatus.TOO_MANY_REQUESTS = 429
____exports.HttpStatus[____exports.HttpStatus.TOO_MANY_REQUESTS] = "TOO_MANY_REQUESTS"
____exports.HttpStatus.REQUEST_HEADER_FIELDS_TOO_LARGE = 431
____exports.HttpStatus[____exports.HttpStatus.REQUEST_HEADER_FIELDS_TOO_LARGE] = "REQUEST_HEADER_FIELDS_TOO_LARGE"
____exports.HttpStatus.UNAVAILABLE_FOR_LEGAL_REASONS = 451
____exports.HttpStatus[____exports.HttpStatus.UNAVAILABLE_FOR_LEGAL_REASONS] = "UNAVAILABLE_FOR_LEGAL_REASONS"
____exports.HttpStatus.INTERNAL_SERVER_ERROR = 500
____exports.HttpStatus[____exports.HttpStatus.INTERNAL_SERVER_ERROR] = "INTERNAL_SERVER_ERROR"
____exports.HttpStatus.NOT_IMPLEMENTED = 501
____exports.HttpStatus[____exports.HttpStatus.NOT_IMPLEMENTED] = "NOT_IMPLEMENTED"
____exports.HttpStatus.BAD_GATEWAY = 502
____exports.HttpStatus[____exports.HttpStatus.BAD_GATEWAY] = "BAD_GATEWAY"
____exports.HttpStatus.SERVICE_UNAVAILABLE = 503
____exports.HttpStatus[____exports.HttpStatus.SERVICE_UNAVAILABLE] = "SERVICE_UNAVAILABLE"
____exports.HttpStatus.GATEWAY_TIMEOUT = 504
____exports.HttpStatus[____exports.HttpStatus.GATEWAY_TIMEOUT] = "GATEWAY_TIMEOUT"
____exports.HttpStatus.HTTP_VERSION_NOT_SUPPORTED = 505
____exports.HttpStatus[____exports.HttpStatus.HTTP_VERSION_NOT_SUPPORTED] = "HTTP_VERSION_NOT_SUPPORTED"
____exports.HttpStatus.INSUFFICIENT_STORAGE = 507
____exports.HttpStatus[____exports.HttpStatus.INSUFFICIENT_STORAGE] = "INSUFFICIENT_STORAGE"
____exports.HttpStatus.NETWORK_AUTHENTICATION_REQUIRED = 511
____exports.HttpStatus[____exports.HttpStatus.NETWORK_AUTHENTICATION_REQUIRED] = "NETWORK_AUTHENTICATION_REQUIRED"
____exports.StatusText = {
    [____exports.HttpStatus.CONTINUE] = "Continue",
    [____exports.HttpStatus.SWITCHING_PROTOCOLS] = "Switching protocols",
    [____exports.HttpStatus.PROCESSING] = "Processing",
    [103] = "Early Hints",
    [200] = "OK",
    [201] = "Created",
    [202] = "Accepted",
    [203] = "Non-Authoritative Information",
    [204] = "No Content",
    [205] = "Reset Content",
    [206] = "Partial Content",
    [207] = "Multi-Status",
    [300] = "Multiple Choices",
    [301] = "Moved Permanently",
    [302] = "Found (Previously \"Moved Temporarily\")",
    [303] = "See Other",
    [304] = "Not Modified",
    [305] = "Use Proxy",
    [307] = "Temporary Redirect",
    [308] = "Permanent Redirect",
    [400] = "Bad Request",
    [401] = "Unauthorized",
    [402] = "Payment Required",
    [403] = "Forbidden",
    [404] = "Not Found",
    [405] = "Method Not Allowed",
    [406] = "Not Acceptable",
    [407] = "Proxy Authentication Required",
    [408] = "Request Timeout",
    [409] = "Conflict",
    [410] = "Gone",
    [411] = "Length Required",
    [412] = "Precondition Failed",
    [413] = "Payload Too Large",
    [414] = "URI Too Long",
    [415] = "Unsupported Media Type",
    [416] = "Range Not Satisfiable",
    [417] = "Expectation Failed",
    [418] = "I'm a Teapot",
    [419] = "INSUFFICIENT_SPACE_ON_RESOURCE",
    [420] = "METHOD_FAILURE",
    [421] = "Misdirected Request",
    [422] = "Unprocessable Entity",
    [423] = "Locked",
    [424] = "Failed Dependency",
    [426] = "Upgrade Required",
    [428] = "Precondition Required",
    [429] = "Too Many Requests",
    [431] = "Request Header Fields Too Large",
    [451] = "Unavailable For Legal Reasons",
    [500] = "Internal Server Error",
    [501] = "Not Implemented",
    [502] = "Bad Gateway",
    [503] = "Service Unavailable",
    [504] = "Gateway Timeout",
    [505] = "HTTP Version Not Supported",
    [507] = "Insufficient Storage",
    [511] = "Network Authentication Required"
}
return ____exports
 end,
["lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.server"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 4,["11"] = 4,["12"] = 5,["13"] = 5,["14"] = 6,["15"] = 6,["26"] = 26,["27"] = 26,["28"] = 26,["29"] = 42,["30"] = 44,["31"] = 46,["32"] = 48,["33"] = 49,["34"] = 41,["35"] = 60,["36"] = 61,["37"] = 62,["38"] = 63,["40"] = 60,["41"] = 77,["42"] = 78,["43"] = 79,["46"] = 81,["47"] = 82,["48"] = 83,["50"] = 85,["52"] = 86,["53"] = 88,["54"] = 88,["55"] = 88,["56"] = 88,["57"] = 89,["58"] = 90,["59"] = 91,["61"] = 95,["62"] = 99,["63"] = 100,["64"] = 101,["65"] = 77});
local ____exports = {}
local ____tslua_2Dcommon = require("lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.lua_modules.@flying-dice.tslua-common.dist.index")
local Logger = ____tslua_2Dcommon.Logger
local socket = require("socket")
local ____constants = require("lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.constants")
local CRLF = ____constants.CRLF
local ____request = require("lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.request")
local readRequestHead = ____request.readRequestHead
local ____response = require("lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.response")
local assembleResponseString = ____response.assembleResponseString
--- Represents an HTTP server.
-- This class encapsulates the functionality required for creating and
-- managing an HTTP server, including binding to a network address,
-- accepting client connections, and handling client requests.
-- 
-- @example // Example of creating and starting an HttpServer with a handler which returns 200 for all requests
-- const httpServer = new HttpServer('127.0.0.1', 8080, (req, res) => { res.status = 200; return res; });
-- while(true) {
--   httpServer.acceptNextClient();
-- }
____exports.HttpServer = __TS__Class()
local HttpServer = ____exports.HttpServer
HttpServer.name = "HttpServer"
function HttpServer.prototype.____constructor(self, bindAddress, port, handler)
    self.handler = handler
    self.logger = __TS__New(Logger, "HttpServer")
    self.server = socket.bind(bindAddress, port)
    self.server:settimeout(0)
end
function HttpServer.prototype.acceptNextClient(self)
    local client = self.server:accept()
    if client then
        self:handleClient(client)
    end
end
function HttpServer.prototype.handleClient(self, client)
    local requestHeadLines = {}
    local lastReceived
    repeat
        do
            local received = client:receive("*l")
            if type(received) == "string" then
                requestHeadLines[#requestHeadLines + 1] = received
            end
            lastReceived = received
        end
    until not (lastReceived ~= "")
    local request = readRequestHead(
        nil,
        table.concat(requestHeadLines, CRLF or ",")
    )
    if request.headers["Content-Length"] then
        client:settimeout(5)
        request.body = client:receive(request.headers["Content-Length"])
    end
    local response = self:handler(request, {status = 404, headers = {}})
    local responseString = assembleResponseString(nil, response)
    client:send(responseString)
    client:close()
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.response"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 1,["10"] = 1,["35"] = 64,["36"] = 65,["37"] = 68,["38"] = 70,["39"] = 70,["40"] = 70,["41"] = 71,["42"] = 70,["43"] = 70,["44"] = 74,["45"] = 76,["46"] = 77,["47"] = 77,["48"] = 77,["49"] = 77,["50"] = 77,["51"] = 77,["52"] = 77,["53"] = 77,["54"] = 77,["56"] = 84,["57"] = 84,["58"] = 84,["59"] = 84,["60"] = 84,["61"] = 84,["62"] = 84,["63"] = 84,["64"] = 84,["66"] = 92,["67"] = 64});
local ____exports = {}
local ____constants = require("lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.constants")
local CRLF = ____constants.CRLF
local EMPTY_LINE = ____constants.EMPTY_LINE
local StatusText = ____constants.StatusText
--- Assembles an HTTP response string based on the provided HttpResponse object.
-- 
-- This function constructs a valid HTTP response string using the status code,
-- headers, and body (if provided) from the HttpResponse object. It includes a
-- default server header indicating the server is "Lua HTTP/1.1". If the status
-- code is not recognized, it defaults to "Unknown Status".
-- 
-- @see https ://developer.mozilla.org/en-US/docs/Web/HTTP/Messages
-- @param response - The HttpResponse object containing the necessary
--   information to construct the response string.
--   It must include a status and headers, with an
--   optional body.
-- @returns The complete HTTP response string, ready to be sent over the network.
-- This string includes the start line (status line), headers, and
-- the response body if provided. Each section is separated by CRLF
-- (Carriage Return and Line Feed) characters.
-- @example const response: HttpResponse = {
--     status: 200,
--     body: 'Hello, world!',
--     headers: {
--         'Content-Type': 'text/plain'
--     }
-- };
-- const responseString = assembleResponseString(response);
function ____exports.assembleResponseString(self, response)
    local startLine = (("HTTP/1.1 " .. tostring(response.status)) .. " ") .. (StatusText[response.status] or "Unknown Status")
    local headers = {"Server: Lua HTTP/1.1"}
    __TS__ArrayForEach(
        __TS__ObjectKeys(response.headers),
        function(____, key)
            headers[#headers + 1] = (key .. ": ") .. response.headers[key]
        end
    )
    local responseString
    if response.body then
        responseString = table.concat(
            {
                startLine,
                table.concat(headers, CRLF or ","),
                EMPTY_LINE,
                response.body
            },
            CRLF or ","
        )
    else
        responseString = table.concat(
            {
                startLine,
                table.concat(headers, CRLF or ","),
                EMPTY_LINE,
                EMPTY_LINE
            },
            CRLF or ","
        )
    end
    return responseString
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.request"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__Unpack = ____lualib.__TS__Unpack
local __TS__StringTrim = ____lualib.__TS__StringTrim
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["25"] = 61,["26"] = 62,["27"] = 62,["28"] = 62,["29"] = 63,["30"] = 65,["31"] = 65,["32"] = 65,["33"] = 65,["34"] = 65,["35"] = 65,["36"] = 65,["37"] = 65,["38"] = 74,["39"] = 75,["42"] = 76,["43"] = 77,["45"] = 80,["46"] = 61});
local ____exports = {}
local ____constants = require("lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.constants")
local CRLF = ____constants.CRLF
local ____query_2Dparams = require("lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.query-params")
local getQueryParams = ____query_2Dparams.getQueryParams
--- Parses an HTTP request string and constructs an HttpRequest object.
-- 
-- This function takes a raw HTTP request payload as a string and parses it to
-- construct an HttpRequest object. It splits the request into its constituent
-- parts: start line, headers, and potentially a body.
-- 
-- @see https ://developer.mozilla.org/en-US/docs/Web/HTTP/Messages
-- @param requestPayload - The complete HTTP request payload as a string.
-- @returns The HttpRequest object representing the parsed request.
-- 
-- The function assumes that the request payload follows the standard HTTP request
-- format, with a start line, followed by headers, an empty line, and an optional body.
____exports.readRequestHead = function(____, requestPayload)
    local ____TS__StringSplit_result_0 = __TS__StringSplit(requestPayload, CRLF)
    local startLine = ____TS__StringSplit_result_0[1]
    local headerLines = __TS__ArraySlice(____TS__StringSplit_result_0, 1)
    local method, originalUrl, protocol = __TS__Unpack(__TS__StringSplit(startLine, " "))
    local httpRequest = {
        method = method,
        path = __TS__StringSplit(originalUrl, "?")[1],
        protocol = protocol,
        headers = {},
        originalUrl = originalUrl,
        parameters = getQueryParams(nil, originalUrl)
    }
    for ____, headerLine in ipairs(headerLines) do
        if headerLine == "" then
            break
        end
        local key, value = __TS__Unpack(__TS__StringSplit(headerLine, ":"))
        httpRequest.headers[__TS__StringTrim(key)] = __TS__StringTrim(value)
    end
    return httpRequest
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.query-params"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__Unpack = ____lualib.__TS__Unpack
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["25"] = 24,["26"] = 25,["27"] = 27,["28"] = 29,["29"] = 30,["30"] = 31,["31"] = 32,["34"] = 36,["35"] = 24});
local ____exports = {}
--- Extracts query parameters from a given URL and returns them as an object.
-- 
-- This function parses the query string part of a URL and converts it into an object
-- where each key-value pair corresponds to a query parameter and its value.
-- 
-- Note:
-- - If the URL does not have query parameters, the function returns an empty object.
-- - The function does not handle array-like query parameters (e.g., "param[]=value1&param[]=value2").
-- - There is no URL validation; if the input is not a string or does not contain valid query parameters,
--   the behavior is undefined.
-- - Special characters in query parameters are not decoded (e.g., "%20" will not be converted to a space).
-- 
-- @see https ://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_is_a_URL
-- @param url - The URL from which to extract the query parameters.
-- @returns An object containing the query parameters as key-value pairs.
-- @example // If the URL is "http://example.com/page?param1=value1&param2=value2"
-- const queryParams = getQueryParams("http://example.com/page?param1=value1&param2=value2");
-- // The function will return: { param1: "value1", param2: "value2" }
function ____exports.getQueryParams(self, url)
    local _, parametersPart = __TS__Unpack(__TS__StringSplit(url, "?"))
    local parameters = {}
    if parametersPart then
        for ____, parameter in ipairs(__TS__StringSplit(parametersPart, "&")) do
            local name, value = __TS__Unpack(__TS__StringSplit(parameter, "="))
            parameters[name] = value
        end
    end
    return parameters
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.lua_modules.@flying-dice.tslua-common.dist.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1});
local ____exports = {}
do
    local ____export = require("lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.lua_modules.@flying-dice.tslua-common.dist.logger")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lua_modules.@flying-dice.tslua-http-api.dist.lua_modules.@flying-dice.tslua-http.dist.lua_modules.@flying-dice.tslua-common.dist.logger"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 7,["8"] = 7,["9"] = 7,["10"] = 8,["11"] = 8,["12"] = 8,["13"] = 17,["14"] = 18,["15"] = 17,["16"] = 28,["17"] = 29,["18"] = 28,["19"] = 39,["20"] = 40,["21"] = 39,["22"] = 50,["23"] = 51,["24"] = 50});
local ____exports = {}
--- Represents a logger that can be used to log messages with different severity levels.
____exports.Logger = __TS__Class()
local Logger = ____exports.Logger
Logger.name = "Logger"
function Logger.prototype.____constructor(self, name)
    self.name = name
end
function Logger.prototype.debug(self, message)
    print((("[DEBUG] [" .. self.name) .. "] - ") .. message)
end
function Logger.prototype.info(self, message)
    print((("[INFO] [" .. self.name) .. "] - ") .. message)
end
function Logger.prototype.warn(self, message)
    print((("[WARN] [" .. self.name) .. "] - ") .. message)
end
function Logger.prototype.error(self, message)
    print((("[ERROR] [" .. self.name) .. "] - ") .. message)
end
return ____exports
 end,
["index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
local ____exports = {}
do
    local ____export = require("app")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
}
local __TS__SourceMapTraceBack = require("lualib_bundle").__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["2660"] = {line = 1, file = "app.ts"},["2661"] = {line = 1, file = "app.ts"},["2662"] = {line = 2, file = "app.ts"},["2663"] = {line = 4, file = "app.ts"},["2664"] = {line = 6, file = "app.ts"},["2665"] = {line = 6, file = "app.ts"},["2666"] = {line = 6, file = "app.ts"},["2667"] = {line = 7, file = "app.ts"},["2668"] = {line = 8, file = "app.ts"},["2671"] = {line = 12, file = "app.ts"},["2672"] = {line = 13, file = "app.ts"},["2673"] = {line = 14, file = "app.ts"},["2674"] = {line = 6, file = "app.ts"},["2675"] = {line = 6, file = "app.ts"},["4029"] = {line = 1, file = "index.ts"}});
return require("index", ...)
