ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

------------ Création du Menu / Sous Menu -----------

RMenu.Add('magasin', 'main', RageUI.CreateMenu("Magasin", "Entrer dans le Magasin"))
RMenu.Add('magasin', 'boisson', RageUI.CreateSubMenu(RMenu:Get('magasin', 'main'), "Boisson", "Accéder au rayon Boisson"))
RMenu.Add('magasin', 'nourriture', RageUI.CreateSubMenu(RMenu:Get('magasin', 'main'), "Nourriture", "Accéder au rayon Nourriture"))
RMenu.Add('magasin', 'diver', RageUI.CreateSubMenu(RMenu:Get('magasin', 'main'), "Diver", "Accéder au rayon Diver"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('magasin', 'main'), true, true, true, function()

            RageUI.Button("Boisson", "Choisi ta Boisson !", {RightLabel = "→→→"},true, function()
            end, RMenu:Get('magasin', 'boisson'))

            RageUI.Button("Nourriture", "Choisi ta Nourriture !", {RightLabel = "→→→"},true, function()
            end, RMenu:Get('magasin', 'nourriture')) 

            --RageUI.Button("Diver", "Choisi ton objet !", {RightLabel = "→→→"},true, function()
            --end, RMenu:Get('magasin', 'diver')) 
        end, function()
        end)

        

        RageUI.IsVisible(RMenu:Get('magasin', 'boisson'), true, true, true, function()

            RageUI.Button("Eau", "Acheter de l'Eau !", {RightLabel = "~g~5$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('Aigle_Shops:BuyEau')
                end
            end)

          --  RageUI.Button("Coca-Cola", "Acheter du Coca !", {RightLabel = "~g~15$"}, true, function(Hovered, Active, Selected)
            --    if (Selected) then
            --        TriggerServerEvent('Aigle_Shops:BuyCoca')
           --     end
          --  end) 
            
            RageUI.Button("Ice Tea", "Acheter de l\'Ice Tea !", {RightLabel = "~g~15$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('Aigle_Shops:BuyIceTea')
                end
            end)
        
        --    RageUI.Button("Fanta", "Acheter du Fanta !", {RightLabel = "~g~15$"}, true, function(Hovered, Active, Selected)
            --    if (Selected) then
              --      TriggerServerEvent('Aigle_Shops:BuyFanta')
           --     end
         --   end)
            
        end, function()
        end)
 
            RageUI.IsVisible(RMenu:Get('magasin', 'nourriture'), true, true, true, function()

                RageUI.Button("Pain", "Acheter du Pain !", {RightLabel = "~g~5$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('Aigle_Shops:BuyPain')
                    end
                end)

                RageUI.Button("Sandwich", "Acheter un Sandwich !", {RightLabel = "~g~15$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('Aigle_Shops:BuySandwich')
                    end
                end)

            
                RageUI.Button("Hamburger", "Acheter un Hamburger !", {RightLabel = "~g~20$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('Aigle_Shops:BuyBurger') 
                    end
                end)
                
            end, function()
                ---Panels
            end, 1)

            RageUI.IsVisible(RMenu:Get('magasin', 'diver'), true, true, true, function()

                RageUI.Button("Telephone", "Acheter un telephone !", {RightLabel = "~g~25$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('Aigle_Shops:BuyPhone')
                    end
                end)
                
            end, function()
                ---Panels
            end, 1)
    
            Citizen.Wait(0)
        end
    end)
 
    ---------------------------------------- Position du Menu --------------------------------------------

    local position = {
        {x = -48.35 , y = -1757.1, z = 29.42, },
        {x = 1136.01 , y = -982.14, z = 46.42, },
        {x = -1222.98 , y = -907.09, z = 12.33, },
        {x = -1487.55 , y = -379.11, z = 40.16, },
        {x = -1968.28 , y = 390.92, z = 15.04, },
        {x = -3038.94 , y = 585.95, z = 7.91, },
        {x = -3241.93 , y = 1001.46, z = 12.83, },
        {x = 2557.46 , y = 382.28, z = 108.62, },
        {x = 547.43 , y = 2671.71, z = 42.15, },
        {x = 2678.85 , y = 3280.59, z = 55.24, },
        {x = 1961.53 , y = 3740.74, z = 32.34, },
        {x = 1392.58 , y = 3604.69, z = 34.98, },
        {x = 1698.39 , y = 4924.4, z = 42.06, },
        {x = 1729.31 , y = 6414.06, z = 35.04, },
        {x = 256.33 , y = -782.07, z = 30.54, },
        {x = 25.67 , y = -1346.37, z = 29.49, },
        {x = 4468.19 , y = -4465.33, z = 4.25, }
    }    
    
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
    
            for k in pairs(position) do
    
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
    
                if dist <= 1.0 then

                   RageUI.Text({
                        message = "Appuyez sur [~b~E~w~] pour parler a ~b~l'Epicier",
                        time_display = 1
                    }) 
                    if IsControlJustPressed(1,51) then
                        RageUI.Visible(RMenu:Get('magasin', 'main'), not RageUI.Visible(RMenu:Get('magasin', 'main')))
                    end
                end
            end
        end
    end)

local blips = { 
    {title="Magasin", colour=2, id=59, x = -48.35 , y = -1757.1, z = 29.42, },
    {title="Magasin", colour=2, id=59, x = 1136.01 , y = -982.14, z = 46.42, },
    {title="Magasin", colour=2, id=59, x = -1222.98 , y = -907.09, z = 12.33, },
    {title="Magasin", colour=2, id=59, x = -1487.55 , y = -379.11, z = 40.16, },
    {title="Magasin", colour=2, id=59, x = -1968.28 , y = 390.92, z = 15.04, },
    {title="Magasin", colour=2, id=59, x = -3038.94 , y = 585.95, z = 7.91, },
    {title="Magasin", colour=2, id=59, x = -3241.93 , y = 1001.46, z = 12.83, },
    {title="Magasin", colour=2, id=59, x = 2557.46 , y = 382.28, z = 108.62, },
    {title="Magasin", colour=2, id=59, x = 547.43 , y = 2671.71, z = 42.15, },
    {title="Magasin", colour=2, id=59, x = 2678.85 , y = 3280.59, z = 55.24, },
    {title="Magasin", colour=2, id=59, x = 1961.53 , y = 3740.74, z = 32.34, },
    {title="Magasin", colour=2, id=59, x = 1392.58 , y = 3604.69, z = 34.98, },
    {title="Magasin", colour=2, id=59, x = 1698.39 , y = 4924.4, z = 42.06, },
    {title="Magasin", colour=2, id=59, x = 1729.31 , y = 6414.06, z = 35.04, },
    {title="Magasin", colour=2, id=59, x = 256.33 , y = -782.07, z = 30.54, },
    {title="Magasin", colour=2, id=59, x = 25.67 , y = -1346.37, z = 29.49, },
    {title="Magasin", colour=2, id=59, x = 4468.19 , y = -4465.33, z = 4.25, }
    
}

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, 59)
        SetBlipDisplay(info.blip, 2)
        SetBlipScale(info.blip, 0.6)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)