@echo off
echo Flutter Figma MCP Server Start...
echo.

REM Execute PowerShell and run commands sequentially
powershell -Command "& {cd D:; cd 'Program Files/Flutter/cursor-talk-to-figma-mcp'; bunx cursor-talk-to-figma-socket}"

pause
