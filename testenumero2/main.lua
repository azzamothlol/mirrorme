--codigo foda feito por dylan

--criar modulo de display
local display = require("display")

-----------------------------------------------------------------------------------------------------------
--plano de fundo
-----------------------------------------------------------------------------------------------------------

--pegar altura e largura da tela
local alturaTela = display.actualContentHeight
local larguraTela = display.actualContentWidth
--criar retangulo plno de fundo
local rectangle = display.newRect(display.contentCenterX, display.contentCenterY, larguraTela, alturaTela)
--adicionar cor ao retangulo
rectangle:setFillColor(0.2, 1, 0.6)

-----------------------------------------------------------------------------------------------------------
--caixa de texto pergunta
-----------------------------------------------------------------------------------------------------------

--criar caixa de texto
local radiusCanto = 20  -- Adjust this value to change the roundness of the corners
local caixatesto = display.newRoundedRect(display.contentCenterX, display.contentCenterY / 5 - 20, larguraTela - 5,70, radiusCanto)

-- cor caixa de texto

caixatesto:setFillColor(0.5, 1, 0.9)

--texto caixa de pergunta

local textoSelecioneDataDeNacimento = {
    text = "selecione sua data de nacimento",
    x = display.contentCenterX,
    y = display.contentCenterY / 5 - 20,
    width = larguraTela - 20,  -- Adjust the width as needed
    font = native.systemFont,
    fontSize = 24,
    align = "center"
}
local text = display.newText(textoSelecioneDataDeNacimento)
text:setFillColor(0)


local function handleTextInput(event)
    local phase = event.phase
    local text = event.text

    -- Validate and filter the input
    if phase == "editing" then
        local filteredText = string.gsub(text, "%D", "")  -- Remove all non-digit characters
        event.target.text = filteredText  -- Update the text box content
    end
end

local perguntaDia = native.newTextBox(display.contentCenterX - 100, display.contentCenterY, 80, 40)
local perguntaMes = native.newTextBox(display.contentCenterX, display.contentCenterY, 80, 40)
local perguntaAno = native.newTextBox(display.contentCenterX + 100, display.contentCenterY, 80, 40)
perguntaDia.isEditable = true  -- Enable user input
perguntaMes.isEditable = true
perguntaAno.isEditable = true
-- Set the keyboard type to numeric
perguntaDia.inputType = "number"
perguntaMes.inputType = "number"
perguntaAno.inputType = "number"

perguntaMes.size = 20
perguntaDia.size = 20
perguntaAno.size = 17


-- Add the text input event listener
perguntaMes:addEventListener("userInput", handleTextInput)
perguntaDia:addEventListener("userInput", handleTextInput)
perguntaAno:addEventListener("userInput", handleTextInput)



-- esconder Barra de estatus
display.setStatusBar(display.HiddenStatusBar)
