--[[
local darius = require(script.Parent)
local randomString = require(script.Parent.utilities).randomString
local lucide = require(script.Parent.Bundles.lucide)
local HttpService = require(script.Parent.Bundles).services.HttpService
local customFunctions = require(script.Parent.utilities).customFunctions

local fakeData = {
	--['dropdown'] = "apple",
	['dropdown_m'] = {"apple", "carrot", "banana"},
	['keybind'] = {keycode = Enum.KeyCode.Q.Name, coordinate = "0,0"},
	['toggle_lk'] = {boolean = true, keycode = Enum.KeyCode.R.Name},
	['toggle'] = {keycode = "E"},
	--['slider'] = 50,
	['textbox'] = "heyy",
	['textbox_n'] = "1121212"
}
customFunctions.makefolder("darius")
customFunctions.makefolder("darius/test")
customFunctions.writefile("darius/test/config.json", HttpService:JSONEncode(fakeData))

local randomIcons = {}
for _,v in lucide do
    table.insert(randomIcons, v)
end
local function randomIcon():string
    return randomIcons[math.floor(math.random(1,#randomIcons))]
end

return function(target)
    local window = darius:Window({
        Title = "Darius",
        Description = "What the sigma this isn't Quantum UI",
        HideBind = Enum.KeyCode.T,
        --UseConfig = true,
        --Config = "test",
        IsMobile = false,
        Theme = {
            background = Color3.fromHex("#D6DCE0"),
            text = Color3.fromHex("#2A2C31"),
            text2 = Color3.fromHex("#7D8694"),
            background2 = Color3.fromHex("#E7E9EF"),
            selectedTab = Color3.fromHex("#FAFFFF"),

            notificationButton = Color3.fromHex("#E7E9EF"),

            mobileButtonBackground = Color3.fromHex("#2A2C31"),
            mobileButtonText = Color3.fromHex("#E7E9EF"),
            mobileButtonImage = Color3.fromHex("#7D8694"),

            disabledBackground = Color3.fromHex("#2A2C31"),
            disabledText = Color3.fromHex("#D6DCE0"),

            toggled = Color3.fromHex("#2A2C31")
        },

        noOffset = true,
        Parent = target
    })


    local tab = window:Tab({
        Name = "Main",
        --Image = randomIcon()
    })
    local tab2 = window:Tab({
        Name = randomString(16),
        Image = randomIcon()
    })
    for i=1,10 do
        window:Tab({
            Name = randomString(6),
            Image = randomIcon()
        })
    end

    tab:ColorPicker({
        Name = "Colorpicker",
        Callback = function(value)
            print(value)
        end
    })

    --[[
    local a
    local toggled = false
    tab:Button({
        Name = "Button",
        DisabledText = "heyy",
        Callback = function()
            a:SetValue(toggled)
            toggled = not toggled
        end
    })

    local ExtractItem = function(itemToClean:string):string
        cleanedItem = itemToClean:match('<font color="rgb%(.-%)">(.-)</font>')
        if cleanedItem then
            cleanedItem = cleanedItem:match("^%s*(.-)%s*$")
        end
    return cleanedItem or itemToClean
    end

    local d1 = tab:Dropdown({
        Name = "Multiselect Dropdown",
        Items = {
            {
                Value = '<font color="rgb(255,0,0)">apple</font>',
                Image = randomIcon()
            },
            'banana',
            'carrot',
            'dingleberry',
            'egg plant',
            'frank',
            'grape',
            'helicopter'
        },
        Multiselect = true,
        Regex = ExtractItem,
        FLAG = "dropdown_m",
        --Default = {"apple"},
        Callback = function(value)
            print(value)
        end
    })
    local d2 = tab:Dropdown({
        Name = "Dropdown",
        Items = {'Legit', 'Blatant'},
        Multiselect = false,
        FLAG = "dropdown",
        Regex = ExtractItem,
        --Default = "Blatant",
        Callback = function(value)

        end
    })

    d1:SetItems({"apple", "fruit", "banana", "rappa"})
    --d2:SelectItem("Legit")
    --d1:SelectItems({"banana", "legit", "rappa"})

    a = tab:Toggle({
        Name = "Toggle",
        --Default = true,
        LinkKeybind = true,
        Bind = Enum.KeyCode.E,
        FLAG = "toggle_lk",
        Callback = function(value)
            --print(`Toggle: {value}`)
        end
    })
    local b
    b = tab:Toggle({
        Name = "the toggle",
        --Default = true,
        FLAG = "toggle",
        Callback = function(v)
            print(v)
        end
    })

    tab:Keybind({
        Name = "Keybind",
        FLAG = "keybind",
        Bind = Enum.KeyCode.O,
        Callback = function()
            print("Keybind ran")
        end
    })

    tab:Slider({
        Name = "Slider",
        Min = 0,
        Max = 100,
        --Default = 10,
        FLAG = "slider",
        Callback = function(value)
            --print(`Slider: {value}`)
        end
    })

    tab:TextBox({
        Name = "TextBox Numbers",
        Placeholder = "Only Numbers",
        ClearTextOnFocus = false,
        OnlyNumbers = true,
        OnLeave = true,
        --Default = "12121212",
        FLAG = "textbox_n",
        Callback = function(value)
            print(`TextBox Numbers: {value}`)
        end
    })
    tab:TextBox({
        Name = "TextBox",
        Placeholder = "ANYTHING",
        OnLeave = false,
        OnlyNumbers = false,
        ClearTextOnFocus = true,
        Default = "alkdjflasdf",
        FLAG = "textbox",
        Callback = function(value)
            --print(`TextBox: {value}`)
        end
    })
    --darius:LoadConfig()
    return function()
        darius:Destroy()
    end
end
]]