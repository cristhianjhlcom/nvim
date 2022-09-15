local status_ok, cloak = pcall(require, "claok")

if not status_ok then
    return
end

cloak.setup {}
