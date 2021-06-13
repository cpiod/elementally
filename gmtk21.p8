pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
-- gmtk2021
-- by cpiod

-- 0: player turn
-- 1: update turn
-- 2: awaiting player movement drawing
-- 3: player update
-- 4: won
-- 10: menu (splash)
-- 11: selection menu
-- 12: title screen for cover
function _init()
 -- font 7x7 by zep
 poke(0x5600,unpack(split"8,8,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63,63,63,63,63,63,63,0,0,0,63,63,63,0,0,0,0,0,63,51,63,0,0,0,0,0,51,12,51,0,0,0,0,0,51,0,51,0,0,0,0,0,51,51,51,0,0,0,0,48,60,63,60,48,0,0,0,3,15,63,15,3,0,0,62,6,6,6,6,0,0,0,0,0,48,48,48,48,62,0,99,54,28,62,8,62,8,0,0,0,0,24,0,0,0,0,0,0,0,0,0,12,24,0,0,0,0,0,0,12,12,0,0,0,10,10,0,0,0,0,0,4,10,4,0,0,0,0,0,0,0,0,0,0,0,0,12,12,12,12,12,0,12,0,0,54,54,0,0,0,0,0,0,54,127,54,54,127,54,0,8,62,11,62,104,62,8,0,0,51,24,12,6,51,0,0,14,27,27,110,59,59,110,0,12,12,0,0,0,0,0,0,24,12,6,6,6,12,24,0,12,24,48,48,48,24,12,0,0,54,28,127,28,54,0,0,0,12,12,63,12,12,0,0,0,0,0,0,0,12,12,6,0,0,0,62,0,0,0,0,0,0,0,0,0,12,12,0,32,48,24,12,6,3,1,0,62,99,115,107,103,99,62,0,24,28,24,24,24,24,60,0,63,96,96,62,3,3,127,0,63,96,96,60,96,96,63,0,51,51,51,126,48,48,48,0,127,3,3,63,96,96,63,0,62,3,3,63,99,99,62,0,127,96,48,24,12,12,12,0,62,99,99,62,99,99,62,0,62,99,99,126,96,96,62,0,0,0,12,0,0,12,0,0,0,0,12,0,0,12,6,0,48,24,12,6,12,24,48,0,0,0,30,0,30,0,0,0,6,12,24,48,24,12,6,0,30,51,48,24,12,0,12,0,0,30,51,59,59,3,30,0,0,0,62,96,126,99,126,0,3,3,63,99,99,99,63,0,0,0,62,99,3,99,62,0,96,96,126,99,99,99,126,0,0,0,62,99,127,3,62,0,124,6,6,63,6,6,6,0,0,0,126,99,99,126,96,62,3,3,63,99,99,99,99,0,0,24,0,28,24,24,60,0,48,0,56,48,48,48,51,30,3,3,51,27,15,27,51,0,12,12,12,12,12,12,56,0,0,0,99,119,127,107,99,0,0,0,63,99,99,99,99,0,0,0,62,99,99,99,62,0,0,0,63,99,99,63,3,3,0,0,126,99,99,126,96,96,0,0,62,99,3,3,3,0,0,0,62,3,62,96,62,0,12,12,62,12,12,12,56,0,0,0,99,99,99,99,126,0,0,0,99,99,34,54,28,0,0,0,99,99,107,127,54,0,0,0,99,54,28,54,99,0,0,0,99,99,99,126,96,62,0,0,127,112,28,7,127,0,62,6,6,6,6,6,62,0,1,3,6,12,24,48,32,0,62,48,48,48,48,48,62,0,12,30,18,0,0,0,0,0,0,0,0,0,0,0,30,0,12,24,0,0,0,0,0,0,28,54,99,99,127,99,99,0,63,99,99,63,99,99,63,0,62,99,3,3,3,99,62,0,31,51,99,99,99,51,31,0,127,3,3,63,3,3,127,0,127,3,3,63,3,3,3,0,62,3,3,115,99,99,126,0,99,99,99,127,99,99,99,0,63,12,12,12,12,12,63,0,127,24,24,24,24,24,15,0,99,51,27,15,27,51,99,0,3,3,3,3,3,3,127,0,99,119,127,107,99,99,99,0,99,103,111,107,123,115,99,0,62,99,99,99,99,99,62,0,63,99,99,63,3,3,3,0,62,99,99,99,99,51,110,0,63,99,99,63,27,51,99,0,62,99,3,62,96,99,62,0,63,12,12,12,12,12,12,0,99,99,99,99,99,99,62,0,99,99,99,99,54,28,8,0,99,99,99,107,127,119,99,0,99,99,54,28,54,99,99,0,99,99,99,126,96,96,63,0,127,96,48,28,6,3,127,0,56,12,12,7,12,12,56,0,8,8,8,0,8,8,8,0,14,24,24,112,24,24,14,0,0,0,110,59,0,0,0,0,0,0,0,0,0,0,0,0,127,127,127,127,127,127,127,0,85,42,85,42,85,42,85,0,65,99,127,93,93,119,62,0,62,99,99,119,62,65,62,0,17,68,17,68,17,68,17,0,4,12,124,62,31,24,16,0,28,38,95,95,127,62,28,0,0,54,127,127,62,28,8,0,42,28,54,119,54,28,42,0,28,28,62,93,28,20,20,0,8,28,62,127,62,42,58,0,62,103,99,103,62,65,62,0,62,127,93,93,127,99,62,0,24,120,8,8,8,15,7,0,62,99,107,99,62,65,62,0,8,20,42,93,42,20,8,0,0,0,0,85,0,0,0,0,62,115,99,115,62,65,62,0,8,28,127,28,54,34,0,0,127,34,20,8,20,34,127,0,62,119,99,99,62,65,62,0,0,10,4,0,80,32,0,0,17,42,68,0,17,42,68,0,62,107,119,107,62,65,62,0,127,0,127,0,127,0,127,0,85,85,85,85,85,85,85,0"))
 t0=-1000

 palt(15,true)
 palt(0,false)
 pal(13,128+5,1)
 pal(14,12,1)
 pal(1,128+1,1)
 pal(12,128+12,1)
 max_level=6
 level=0
 go_to_menu()
 cartdata("cpiod_elementally")
-- dset(0,6)
 max_reach_level=dget(0)
 menuitem(2,"go to main menu", go_to_menu)
 menuitem(1,"restart puzzle", load_puzzle)
-- max_reach_level=6 -- todo!!
-- state=12
-- level=0
-- load_puzzle(select_level)
-- state=0
end

function go_to_menu()
 select_level=max(level,0)
 level=-1
 load_puzzle()
 state=11
 last=t()
 music(0)
end

function load_puzzle()
 di=level*16
 dj=16
 boulders={}
 players={}
 state=0
 current_p=1
 if(level==-1) dj=0 di=32 state=11
 for i=0,15 do
  for j=0,15 do
   val=mget(i+di,j+dj)
   if val>=7 and val<=11 then
    local p={}
    p.x=i*8
    p.y=j*8
    p.ox=p.x
    p.oy=p.y
    p.s=val-6
    p.o=false
    add(players,p)
    val=0
   elseif val==16 then
    add(boulders, {x=i*8,y=j*8,ox=i*8,oy=j*8})
    val=0
   end
   mset(i,j,val==0 and 18 or val)
  end
 end
-- assert(#players>0)
end

function update_player()
 local dx,dy=0,0
 local p=players[current_p]
 if btnp(❎) then
  current_p+=1
  if(current_p>#players) current_p=1
 elseif btnp(🅾️) then
  state=1
 elseif btn(⬆️) then
  dy=-8
 elseif btn(➡️) then
  dx=8
  p.o=false
 elseif btn(⬇️) then
  dy=8
 elseif btn(⬅️) then
  dx=-8
  p.o=true
 end
 local x=p.x+dx
 local y=p.y+dy
 if (dx!=0 or dy!=0) and x>=0 and x<128 and y>=0 and y<128 and fget(get_type(mget(x/8,y/8)),p.s) then
  if p.s==fire and is_there_boulder(x/8,y/8) then
   -- fire cannot move past boulder
   x=p.x
   y=p.y
  end
  if p.s!=fire and p.s!=water then -- fire and water can't push
	  for b in all(boulders) do
	   if x==b.x and y==b.y then
	    -- where the boulder would go
	    local xb=(x+dx)/8
	    local yb=(y+dy)/8
	    if not is_occupied(xb,yb) and fget(get_type(mget(xb,yb)),earth) then
	     b.ox+=dx
	     b.oy+=dy
	     state=1
 	    break
 	   else
 	    -- cancel move
 	    x=p.x
 	    y=p.y
 	   end
	   end
	  end
	 -- no push
  end
  if x!=p.x or y!=p.y then
   p.ox,p.oy=x,y
   state=1
  end
 end
 if(state==1) t0=t()+.3
end

function update_world()
  -- world update
	 for x=0,15 do
	  for y=0,15 do
	   local raw=mget(x,y)
	   local typ=get_type(raw)
 	  local new=typ==nil and mget(x,y) or update_tile(x,y,typ,raw) or mget(x,y)
 	  mset(x+16,y,new)
	  end
	 end
	 
	 for x=0,15 do
		 for y=0,15 do
		  mset(x,y,mget(x+16,y))
		 end
		end
end

function update_menu()
 if(t()-last>.3) t0=t()+.3 last=t() update_world()
 if state==10 and btnp(🅾️) then
  state=11
 elseif state==11 then
  if btnp(➡️) and select_level<max_level then
   select_level+=1
  elseif btnp(⬅️) and select_level>0 then
   select_level-=1
  elseif btnp(🅾️) then
   if select_level>max_reach_level then
    -- nope
   else
    level=select_level
    load_puzzle()
    music(53)
   end
  end
 end
end

function _update60()
 
 if state>=10 then
  update_menu()
  return
 end
 
 if state==3 then
  local p=players[current_p]
	 for b in all(boulders) do
   if get_type(mget(b.x/8,b.y/8))==water then
    mset(b.x/8,b.y/8,2)
	   del(boulders,b)
   end
  end
	
	 -- update players
	 for p in all(players) do
		 p.ex_s=p.s
		 p.s=update_tile(p.x/8,p.y/8,p.s,nil,true) or p.s
	 end
	 state=0
 end
 
 if state==0 then
  for p in all(players) do
   if mget(p.x/8,p.y/8)==178 then
    state=4
    t0=t()
    return
   end
  end
  local ok=true
  for p in all(players) do
   if p.x!=p.ox or p.y!=p.oy then
    ok=false
    break
   end
  end
  if(ok) update_player()
 end
 
 if state==1 then
  update_world()
  state=2
	end
		
end

-->8
-- draw

function draw_game()
	cls(13)
	for i=0,15 do
	 for j=0,15 do
	  spr(18,i*8,j*8)
	 end
	end
	map()
	
	for i=0,15 do
	 for j=0,15 do
	  -- water animation
	 	if get_type(mget(i,j))==water then
	 	 local t1=(t()+i*1.2+j*1.5)%4
    if t1<.6 then
     local s=flr(t1*5)
     spr(mget(i,j)+9+s,i*8,j*8)
    end
	 	-- fire animation
	 	elseif get_type(mget(i,j))==fire then
	 	 spr(18,i*8,j*8)
	 	 if mget(i,j)==65 then
	 	  spr(3,i*8,j*8)
	 	 elseif mget(i,j)==81 then
	 	  spr(5,i*8,j*8)
	 	  spr(3,i*8,j*8)
	 	 end
	 	 local sprite=1+16*flr(((i+j)*1.2+4*t())%4)
	 	 spr(sprite,i*8,j*8)
	 	
	 	-- plant animation
	  elseif mget(i,j)==51 then	  
		  spr(18,i*8,j*8)
		  diff=t0-t()
		  if diff<0 then
 		  spr(3,i*8,j*8)
 		 elseif diff<.1 then
 		  spr(19,i*8,j*8)
 		 elseif diff<.2 then
 		  spr(35,i*8,j*8)
 		 else
 		  spr(51,i*8,j*8)
 		 end
	  elseif mget(i,j)==130 then	  
		  spr(18,i*8,j*8)
		  diff=t0-t()
		  if diff>=0 then
			  if diff<0.1 then
	 		  spr(162,i*8,j*8)
	 		 elseif diff<.2 then
	 		  spr(146,i*8,j*8)
	 		 else
	 		  spr(130,i*8,j*8)
	 		 end
 		 end
		 end
	 end
	end

	for b in all(boulders) do
	 spr(16,b.x,b.y-2)
 	if(b.x<b.ox) b.x+=1
 	if(b.y<b.oy) b.y+=1
 	if(b.x>b.ox) b.x-=1
 	if(b.y>b.oy) b.y-=1
	end
	local p=players[current_p]
	if #players>1 then
		circ(p.x+4,p.y+4,4,8)
		circ(p.x+4,p.y+4,3,0)
		circ(p.x+4,p.y+4,5,0)
	end
	for p in all(players) do
 	local sprite=6+p.s
--	 	if(p.x!=p.ox or p.y!=p.oy) sprite+=32*flr(2*t()%2)
 	sprite+=32*flr((p.x+p.y)/8%2)
 	spr(sprite,p.x,p.y-10,1,2,p.o)
 	if(p.x<p.ox) p.x+=1
 	if(p.y<p.oy) p.y+=1
 	if(p.x>p.ox) p.x-=1
 	if(p.y>p.oy) p.y-=1
 	if(state==2 and p.x==p.ox and p.y==p.oy) state=3
 end
	if level==0 then
	 print2("press p for menu",5,112,12)
	 print2("press z to wait",5,120,12)
 elseif level==5 then
  print2("press c to switch\nelementals",5,25,12)
	end
end

function print_center(s,y,c,big)
 if big then
  x=(64-8*(#s/2))
 else
  x=(64-4*(#s/2))
 end
 print2(s,x,y,c,big)
end

function print2(s,x,y,c,big)
 if(big) s="\014"..s
 for i=-1,1 do
  for j=-1,1 do
   if(i==0 or j==0) print(s,x+i,y+j,0)
  end
 end
 print(""..s,x,y,c)
end

function draw_menu()
-- if state==10 then
--  if(t()%1>.2) print2("press z to start",90,7)
-- else
 if state==11 then
  print_center("eLEMENTALLY",30,8,true)
  print_center("bY cpiod FOR gmtk21",121,6)
 
  local s="lEVEL "..(select_level+1)
  if select_level!=0 then
   s="< "..s
  end
  if select_level!=max_level then
   s=s.." >"
  end
  c=select_level>max_reach_level and 5 or 7
  print_center(s,90,c,true)
  print_center("press z to start",113,7)
 elseif state==12 then
  print_center("eLEMENTALLY",60,8,true)
 end
end

function _draw()
 if state>=10 then
  draw_game()
  draw_menu()
 elseif state<10 then
  draw_game()
  if state==4 then
   circfill(64,64,(t()-t0)*200,0)
   if t()-t0>.7 then
    max_reach_level=max(level+2,max_reach_level)
    max_reach_level=min(max_level,max_reach_level)
    local levelbak=level
    dset(0,max_reach_level)
    go_to_menu()
    state=11
    select_level=min(max_reach_level,levelbak+1)
   end
  end
 end
end
-->8
-- tick

fire=1
earth=2
plant=3
water=4
ice=5
concrete=6

function is_there_boulder(x,y)
 if(x<0 or x>15 or y<0 or y>15) return true
 for b in all(boulders) do
  if(b.ox/8==x and b.oy/8==y) return true
 end
 return false
end

function is_occupied(x,y)
 if(x<0 or x>15 or y<0 or y>15) return true
 for b in all(boulders) do
  if(b.ox/8==x and b.oy/8==y) return true
 end
 for p in all(players) do
  if(p.ox/8==x and p.oy/8==y) return true
 end
 if(mget2(x,y)==plant) return true
 return false
end

function get_type(t)
 if(t==0) return 2
 local t=t%16
 if t>=1 and t<=5 then
  return t
 else
  return nil
 end
end

function mget2(x,y)
 if x>=0 and x<16 and y>=0 and y<16 then
  return get_type(mget(x,y))
 else
  return -1
 end
end

function close_to(x,y,t)
	for dx=-1,1 do
	 for dy=-1,1 do
   if(mget2(x+dx,y+dy)==t) return true
   for p in all(players) do
	   if(x+dx==p.x/8 and y+dy==p.y/8 and p.s==t) return true
	  end
	 end
	end
 return false
end

function is_water(raw)
 return get_type(raw)==water or get_type(raw)==ice or raw==81 or raw==67
end

function check_water(x,y,raw)
 local s=mget(x,y)
 return y==0 or
 ((s==4 or s==36 or s==52 or s==100 or s==116 or s==180) and is_water(mget(x,y-1)))
 or ((s==68 or s==148 or s==164) and is_water(mget(x-1,y)))
 or ((s==84 or s==132) and is_water(mget(x+1,y)))
end

function update_tile(x,y,typ,raw,player)
 player=player or false
 raw=raw or typ
 if typ==fire then
  if get_type(mget(x,y))==water then
   return water
  elseif player then
   return fire
  elseif raw==81 then
   return water
  elseif raw==65 or raw==1 then
   return 17
  else
   return 114
  end
 elseif typ==earth then
  if not close_to(x,y,fire) and (not player and not is_occupied(x,y)) and close_to(x,y,water) and close_to(x,y,plant) then
   return 51 -- baby plant
  elseif get_type(mget(x,y))==water then
   return water
  elseif raw==130 then
   return 114
  elseif player then
   return earth
  end
 elseif typ==plant then
  if close_to(x,y,fire) then
   if(player) return earth
   if(raw==67) return 81 -- plant on ice
   return 65 -- plant on fire
  elseif player then
   return plant
  elseif raw==67 then
   return 67
  elseif not close_to(x,y,water) and not close_to(x,y,ice) then
   return 130 -- dying
  else
   return plant -- big plant
  end
 elseif typ==water and mget(x,y)!=20 then
  if not player and not check_water(x,y,raw) then
   if(raw>=116) return 2
   return raw-2
  elseif player and get_type(mget(x,y))!=water and close_to(x,y,fire) then
   return earth
--  elseif not player and get_type(mget(x,y))==ice then
--   return ice
  end
 elseif typ==ice then
  if close_to(x,y,fire) then
   return raw-1
  end
 end
 return nil
end
__gfx__
00000000ffff8fff44444444fffbbbff4cccccc4e777777ef000000fffffffffffffffffffffffffffffffffffffffffffffffff4cccccc44cccccc44cccccc4
00000000ff8898ff44444444ffb333bf4cccccc4e777777e05555550ffffffffffffffffffffffffffffffffffffffffffffffff4cecccc44cccccc44cccccc4
00700700f889988f44444444fb33333b4cccccc4e7ee777e05555550fff000fffff000fffff000fffff000fffff000fffff000ff4cccccc44cccccc44cccccc4
00077000f899998f44444444f33333334cccccc4e777777e05555550ff09890fff04440fff033b0fff01110fff07770fff05550f4cccccc44cccccc44cccccc4
000770008899998f44444444f333333f4cccccc4e777777e05555550f009a90ff004240ff003a30ff001c10ff007c70ff005350f4cccccc44cccecc44cccccc4
00700700889a998f44444444ff3333334cccccc4e777777e05555550f08999aff044442ff03333aff01111cff07777cff055553f4cccccc44cccccc44cccccc4
00000000f8aaa88f44444444fff443ff4cccccc4e777ee7e05555550ff09980fff04440fff03330fff01110fff07770fff05550f4cccccc44cccccc44cccccc4
00000000ff8888ff44444444ffffffff4cccccc4e777777ef000000fff0000ffff0000ffff0000ffff0000ffff0000ffff0000ff4cccccc44cccccc44ccccec4
ff0000fffff88fffddddddddfffffffffff555fffff555ff00000000fff090fffff040fffff030fffff010fffff070fffff050fffff555fffff555fffff555ff
f044440ffff888ffddddddddfffbbbfff555555ff555555f00000000f0098900f0044400f0033b00f0011100f0077700f0055500f555555ff555555ff555555f
04444440ff88998fddddddddffb333bff555c55ff555755f00000000f0809990f0404440f0b03330f0101110f0707770f0505550f555c55ff555c55ff555c55f
04944440f8899988ddddddddff33333ff555c55ff555755f00000000ff09990fff04440fff03330fff01110fff07770fff05550ff555c55ff555c55ff555c55f
04994440f8999988ddddddddff33333ff55cc55ff557755f00000000f0099090f0044040f003b030f0011010f0077070f0055050f55cc55ff55cc55ff55cc55f
04444440f899a988ddddddddfff3333ff45cc54ffe5775ef00000000f0909080f0404040f0303030f0101010f0707070f0505050f45cc54ff45cc54ff45cc54f
f044440ff89aa99fddddddddffff4fff44cccc44ee7777ee00000000f0800090f0400040f03000b0f0100010f0700070f050005044cecc4444cccc4444cccc44
ff0000ffff88888fddddddddffffffff44ccccc4ee77777e00000000f000f000f000f000f000f000f000f000f000f000f000f00044ccccc444ccecc444ccccc4
00000000fff88fff44444444ffffffff4cccccc4e777777e00000000ffffffffffffffffffffffffffffffffffffffffffffffff4cceccc44cccccc44cccccc4
00000000ff8888ff44444444ffffffff4ccccccce777777700000000ffffffffffffffffffffffffffffffffffffffffffffffff4ccccccc4ccccccc4ccccccc
00000000f88898ff44444444ffffffff4ccccccce777ee7700000000ffffffffffffffffffffffffffffffffffffffffffffffff4ccccccc4ccccccc4ccccccc
00000000f889998f44444444fffffffff4ccccccfe77777700000000fff000fffff000fffff000fffff000fffff000fffff000fff4ccccccf4ccceccf4cccccc
00000000f8999988f4444444ffff3fffff4cccccffe7777700000000f008990ff004440ff0033b0ff001110ff007770ff005550fff4cccccff4cccccff4ccccc
00000000f89a9988f4444444fff333fffff44cccfffee77700000000f099a90ff044240ff033a30ff011c10ff077c70ff055350ffff44cccfff44cccfff44cce
00000000f8aaa98fff444444ffff4ffffffff44cfffffee700000000f08999aff044442ff03333aff01111cff07777cff055553ffffff44cfffff44cfffff44c
00000000ff8888fffff44444fffffffffffffff4fffffffe00000000ff09980fff04440fff03330fff01110fff07770fff05550ffffffff4fffffff4fffffff4
00000000fff8ffff44444444ffffffff4cccccc4e777777e00000000ff0000ffff0000ffff0000ffff0000ffff0000ffff0000ff4cccecc44cccccc44cccccc4
00000000fff88fff44444444ffffffffcccccc4f77e777ef00000000f0909800f0404400f0303b00f0101100f0707700f0505500cccccc4fcccccc4fcccccc4f
00000000ff8888ff44444444ffffffffcccccc4f777e77ef00000000f0989990f0444440f0333330f0111110f0777770f0555550cccccc4fcccccc4fcccccc4f
00000000f889988f44444444ffffffffcccccc4f777777ef00000000ff09990fff04440fff03b30fff01110fff07770fff05550fcccccc4fcceccc4fcccccc4f
000000008889998f4444444fffffffffccccc4ff77777eff000000000090990f0040440f00b0330f0010110f0070770f0050550fccccc4ffccccc4ffccccc4ff
000000008899998f4444444fffffffffccc44fff777eefff00000000098008900440044003300330011001100770077005500550ccc44fffccc44fffecc44fff
00000000f89aa98f444444ffffff3fffc44fffff7eefffff00000000090ff090040ff040030ff0b0010ff010070ff070050ff050c44fffffc44fffffc44fffff
00000000ff8888ff44444fffffffffff4fffffffefffffff00000000f00ff000f00ff000f00ff000f00ff000f00ff000f00ff0004fffffff4fffffff4fffffff
00000000fffbbbff44444fffe77bbb7e44ffffffeeffffff0000000000000000000000000000000000000000000000000000000044ffffff44ffffff44ffffff
00000000ffb333bf444444ffe7b333becc444fff77eeefff00000000000000000000000000000000000000000000000000000000cc444fffcc444fffcc444fff
00000000fb33333b4444444feb33333bccccc4ff77777eff00000000000000000000000000000000000000000000000000000000ccccc4ffccccc4ffccccc4ff
00000000f33333334444444fe3333333cccccc4f777777ef00000000000000000000000000000000000000000000000000000000cecccc4fcccccc4fcccccc4f
00000000f333333f44444444e333333ecccccc4f777e77ef00000000000000000000000000000000000000000000000000000000cccccc4fcccccc4fcccccc4f
00000000ff33333344444444e7333333cccccc4f77e777ef00000000000000000000000000000000000000000000000000000000cccccc4fcccecc4fcccccc4f
00000000fff443ff44444444e774437ecccccc4f777777ef00000000000000000000000000000000000000000000000000000000cccccc4fcccccc4fcccccc4f
00000000ffffffff44444444e777777e4cccccc4e777777e000000000000000000000000000000000000000000000000000000004cccccc44cccccc44cccecc4
0000000000000000fff4444400000000fffffff4fffffffe00000000000000000000000000000000000000000000000000000000fffffff4fffffff4fffffff4
0000000000000000ff44444400000000ffff444cffffeee700000000000000000000000000000000000000000000000000000000ffff444cffff444cffff444c
0000000000000000f444444400000000fff4ccccfffe777700000000000000000000000000000000000000000000000000000000fff4ccccfff4ccccfff4cccc
0000000000000000f444444400000000ff4cccccffe7777700000000000000000000000000000000000000000000000000000000ff4cccceff4cccccff4ccccc
00000000000000004444444400000000f4ccccccfe77777700000000000000000000000000000000000000000000000000000000f4ccccccf4ccccccf4cccccc
00000000000000004444444400000000f4ccccccfe77ee7700000000000000000000000000000000000000000000000000000000f4ccccccf4ccecccf4cccccc
000000000000000044444444000000004ccccccce7777777000000000000000000000000000000000000000000000000000000004ccccccc4ccccccc4ccccccc
000000000000000044444444000000004cccccc4e777777e000000000000000000000000000000000000000000000000000000004cccccc44cccccc44cceccc4
000000000000000044444444000000004cccccc4e777777e000000000000000000000000000000000000000000000000000000004cccccc44cccccc44cccccc4
0000000000000000f444444400000000f4ccccc4fe77777e00000000000000000000000000000000000000000000000000000000f4ccccc4f4ccccc4f4ccccc4
0000000000000000f444444400000000f4ccccc4fe77777e00000000000000000000000000000000000000000000000000000000f4ccccc4f4ccccc4f4ccccc4
0000000000000000f444444400000000f4ccccc4fe77777e00000000000000000000000000000000000000000000000000000000f4ccccc4f4ccccc4f4ccccc4
00000000000000004444444f000000004ccccc4fe77777ef000000000000000000000000000000000000000000000000000000004ccccc4f4ccccc4f4ccccc4f
00000000000000004444444f000000004ccccc4fe77777ef000000000000000000000000000000000000000000000000000000004ccccc4f4ccccc4f4ccccc4f
0000000000000000f44444ff00000000f44cc4fffee77eff00000000000000000000000000000000000000000000000000000000f44cc4fff44cc4fff44cc4ff
0000000000000000fff44fff00000000fff44ffffffeefff00000000000000000000000000000000000000000000000000000000fff44ffffff44ffffff44fff
0000000000000000ffffffff000000004ccccccce7777777000000000000000000000000000000000000000000000000000000004ccccccc4ccccccc4ccccccc
0000000000000000ffffffff000000004ccccccce7777777000000000000000000000000000000000000000000000000000000004ccecccc4ccccccc4ccccccc
0000000000000000ffffffff000000004ccccccce77ee777000000000000000000000000000000000000000000000000000000004ccccccc4ccccccc4ccccccc
0000000000000000ffffffff000000004ccccccce7777777000000000000000000000000000000000000000000000000000000004ccccccc4ccccccc4ccccccc
0000000000000000ffffffff000000004ccccccce7777777000000000000000000000000000000000000000000000000000000004ccccccc4ccceccc4ccccccc
0000000000000000ffff44ff000000004ccccccce7777ee7000000000000000000000000000000000000000000000000000000004ccccccc4ccccccc4ccccccc
0000000000000000fff4444f000000004ccccccce7777777000000000000000000000000000000000000000000000000000000004ccccccc4ccccccc4ccccccc
0000000000000000ffff44ff000000004ccccccce7777777000000000000000000000000000000000000000000000000000000004ccccccc4ccccccc4ccceccc
0000000000000000ffffffff0000000044444444eeeeeeee00000000000000000000000000000000000000000000000000000000444444444444444444444444
0000000000000000ffffffff00000000cccccccc7777777700000000000000000000000000000000000000000000000000000000cccccccccccccccccccccccc
0000000000000000fffbbbff00000000cccccccc77777ee700000000000000000000000000000000000000000000000000000000cccccceccccccccccccccccc
0000000000000000ffb333bf00000000cccccccc7777777700000000000000000000000000000000000000000000000000000000cccccccccccceccccccccccc
0000000000000000ffb3333f00000000cccccccc7777777700000000000000000000000000000000000000000000000000000000cccccccccccccccccecccccc
0000000000000000fff3333f00000000cccccccc777ee77700000000000000000000000000000000000000000000000000000000cccccccccccccccccccccccc
0000000000000000ffff4fff00000000cccccccc7777777700000000000000000000000000000000000000000000000000000000cccccccccccccccccccccccc
0000000000000000ffffffff0000000044444444eeeeeeee00000000000000000000000000000000000000000000000000000000444444444444444444444444
0000000000000000ffffffff0000000044444444eeeeeeee00000000000000000000000000000000000000000000000000000000444444444444444444444444
0000000000000000ffffffff00000000cccccccc7777777700000000000000000000000000000000000000000000000000000000cccccccccccccccccccccccc
0000000000000000ffffffff00000000cccccccc7777777700000000000000000000000000000000000000000000000000000000cecccccccccccccccccccccc
0000000000000000ffffffff00000000cccccccc777ee77700000000000000000000000000000000000000000000000000000000ccccccccccccccccccccccec
0000000000000000fffaaaff00000000cccccccc7777777700000000000000000000000000000000000000000000000000000000cccccccccccecccccccccccc
0000000000000000ffaaaaaf00000000cccccccc7777777700000000000000000000000000000000000000000000000000000000cccccccccccccccccccccccc
0000000000000000ffaf4ffa00000000cccccccc7777777700000000000000000000000000000000000000000000000000000000cccccccccccccccccccccccc
0000000000000000ffffffff0000000044444444eeeeeeee00000000000000000000000000000000000000000000000000000000444444444444444444444444
0000000000000000ffffffff000000004444ffffeeeeffff000000000000000000000000000000000000000000000000000000004444ffff4444ffff4444ffff
0000000000000000ffffffff00000000cccc44ff7777eeff00000000000000000000000000000000000000000000000000000000cccc44ffcccc44ffcccc44ff
0000000000000000ffffffff00000000cccccc4f777777ef00000000000000000000000000000000000000000000000000000000cccccc4fcccccc4fcccccc4f
0000000000000000ffffffff00000000ccccccc4777ee77e00000000000000000000000000000000000000000000000000000000ccccccc4ccccccc4ccccccc4
0000000000000000ffffffff00000000ccccccc47777777e00000000000000000000000000000000000000000000000000000000ccccccc4ccccccc4ccccccc4
0000000000000000ffffafff00000000cccccc4f777777ef00000000000000000000000000000000000000000000000000000000cccccc4fcccccc4fcccccc4f
0000000000000000fffa4aff00000000c444cc4f7eee77ef00000000000000000000000000000000000000000000000000000000c444cc4fc444cc4fc444cc4f
0000000000000000ffffffff000000004fff44ffefffeeff000000000000000000000000000000000000000000000000000000004fff44ff4fff44ff4fff44ff
0000000000000000ffffffff00000000ccccccc47777777e00000000000000000000000000000000000000000000000000000000ccccccc4ccccccc4ccccccc4
0000000000000000faaaaaff00000000ccccccc47777777e00000000000000000000000000000000000000000000000000000000ccceccc4ccccccc4ccccccc4
0000000000000000faaaaaff00000000ccccccc477ee777e00000000000000000000000000000000000000000000000000000000ccccccc4ccccccc4ccccccc4
0000000000000000faaaaaff00000000ccccccc47777777e00000000000000000000000000000000000000000000000000000000ccccccc4ccccccc4ccccccc4
0000000000000000faffffff00000000ccccccc47777777e00000000000000000000000000000000000000000000000000000000ccccccc4ccceccc4ccccccc4
0000000000000000faffffff00000000ccccccc47777777e00000000000000000000000000000000000000000000000000000000ccccccc4ccccccc4ccccccc4
0000000000000000faffffff00000000ccccccc4777ee77e00000000000000000000000000000000000000000000000000000000ccccccc4ccccccc4ccccccc4
0000000000000000faffffff00000000ccccccc47777777e00000000000000000000000000000000000000000000000000000000ccccccc4ccccccc4ccceccc4
0000000000000000dddddddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000dddddddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000dddddddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000dddddd3d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000dd3ddd3d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000dd3ddddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000dddddddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000dddddddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000dddddddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000dddd3ddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000dddd3ddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000dddddddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000d3dddddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000d3dddd3d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000dddddd3d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000dddddddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllllll88llllll8lllllllb8bllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllll8888lllll88lllll8898blllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllll88898llll8888lll889988bllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllll889998ll889988ll8999983llllllllllllllllllllll3lllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllll89999888889998l8899998lllllllllllllllllll3lll3lllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllll89a99888899998l889a9983llllllllllllllllll3lllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllll8aaa98ll89aa98ll8aaa88lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllll8888llll8888llll8888llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllllllllllllll555lllll88blllllbbbllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllllllllllll555555lllb888blllb333blllllllllllllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllllllllllll555s55llb88998blb33333bllllllllllllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllllllllllll555s55ll8899988l3333333llllllllllllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllllllllllll55ss55ll8999988l333333lllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllll44lll45ss54ll899a988ll333333llllllllllllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllllll4444l44ssss44l89aa99llll443llllllllllllllllllllllllllll0000llllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllll44ll44sssss4ll88888llllllllllllllllllllllllllllllllll044440lllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllll4ssssss444lllllllllbbblllllbbbllllllllllllllllll04444440llllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllll4sssssssss444lllllb333blllb333blllllllllllllllll04944440llllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllll4ssssssssssss4lllb33333blb33333bllllllllllllllll04994440llllllllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllllllllllll4ssssssssssss4ll3333333l3333333llllllllllllllll04444440llllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllll4sssssssssss4ll333333ll333333llllllllllllllllll044440lllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllll44lllll44sssssssss4lll333333ll333333llllllllllllllllll0000llllllllllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllllll4444llllll44sssssss4llll443lllll443llllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllll44lllllllll44ssssss4llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllll4sscsss444lllllllllbbbllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllll3lllllllllllllllllllllllllllllllllll4sssssssss444lllllb333blllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllll3lllllllllllllllllllllllllllllllllll4ssssssssssss4lllb33333bllllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllllllllllllllllllll4ssssssssssss4ll3333333llllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllll3llllllllllllllllllllllllllllllllllllllll4sssssssssss4ll333333lllllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllll3llll3lllllllllllllllllllllllllllll44lllll44sssssssss4lll333333llllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllll3llllllllllllllllllllllllllll4444llllll44sssssss4llll443llllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllll44lllllllll44ssssss4llllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll4ssssss4lllbbblllllbbbllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll4ssssss4llb333blllb333blllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll4ssssss4lb33333blb33333bllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll4ssssss4l3333333l3333333llllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll4ssssss4l333333ll333333lllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllll44llllll44ll4ssssss4ll333333ll333333llllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllll0000lllllllllllllllllllll4444llll4444l4ssssss4lll443lllll443llllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllll044440lllllllllllllllllllll44llllll44ll4ssssss4llllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllll04444440llllllllllllllllllllllllllllllll4sssssss44lllllllllbbblllllbbbllllllllllllllllllllllllllllllllll
llllllllllllllllllllllll04944440llllllllllllllllllllllllllllllll4sssssssss444lllllb333blllb333blllllllllllllllllllllllllllllllll
llllllllllllllllllllllll04994440llllllllllllllllllllllllllllllll4ssssssssssss4lllb33333blb33333bllllllllllllllllllllllllllllllll
llllllllllllllllllllllll04444440llllllllllllllllllllllllllllllll4sssssssssssss4ll3333333l3333333llllllllllllllllllllllllllllllll
lllllllllllllllllllllllll044440lllllllllllllllllllllllllllllllll4ssscsssssssss4ll333333ll333333lllllllllllllllllllllllllllllllll
llllllllllllllllllllllllll0000llllllllllllllllllllllllllllllllll4sssssssssssss4lll333333ll333333llllllllllllllllllllllllllllllll
llllllllllllllllllllllllll0000llllllllllllllllllllllllllllllllll4sssssssssssss4llll443lllll443llllllllllllllllllllllllllllllllll
lllllllllllllllllllllllll044440lllllllllllllllllllllllllllllllll4sssssss4ssssss4llllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllll555ll04444440lllllllllllllll444444444444444444ssssss44ssssss444lllllllllbbbllllllllllllllllllllllllllllllllll
lllllllllllllllll555555l04944440llllllllllll444sssssssssssssssssssssss4l4sssssssss444lllllb333blllll3lllllllllllllllllllllllllll
lllllllllllllllll555755l04994440lllllllllll4ssssssssssssssssssssssssss4l4ssssssssssss4lllb33333bllll3lllllllllllllllllllllllllll
lllllllllllllllll555000000044400llllllllll4sssssssssssssssssssssssssss00l4ssssssssssss00l3333300llllllllllllllllllllllllllllllll
lllllllllllllllll5508888888040880llllllll4sssssssssssssssssssssssssss0880l4ssssssssss0880333308803llllllllllllllllllllllllllllll
lllllllllllllllllc508800000000880llll00000ss00sss00ss00000ss000000s4408800l4400000scs0880l33308803ll003ll00lllllllllllllllllllll
llllllllllllllllcc70880000lll0880lll08888800880s0880088888008888880l0888880l0888880ss0880ll440880ll0880l0880llllllllllllllllllll
llllllllllllllllcc708888880ll0880ll088000880888088808800088088000880l08800lll0000880s0880llll0880ll0880l0880llllllllllllllllllll
llllllllllllllllc770880000lll0880ll0888888808888888088888880880l0880l0880lll08888880s0880llbb0880ll088000880llllllllllllllllllll
llllllllllllllllc7708800000ll08800l0880000008808088088000000880l0880l08800l088000880s08800b3308800ll08888880llllllllllllllllllll
llllllllllllllllc7c088888880ll08880l088888008800088008888800880l0880ll08880l08888880ss0888033308880ll0000880llllllllllllllllllll
llllllllllllllllc7770000000llll000lll00000ss00s4l00ll00000ll00lll00llll000lll000000ssss00033333000ll0888880lllllllllllllllllllll
llllllllllllllllc777777cllllllllllllllll4sssss4lllllllllllllllllllllllllllllllll4ssssss4l333333llllll00000llllllllllllllllllllll
llllllllllllllllc777777cllllllllllllllll4sssss4lllllllllllllllllllllllllllllllll4ssssss4ll333333llllllllllllllllllllllllllllllll
llllllllllllllllc777cc7clllllllllllllllll44ss4llllllllllllllllllllllllllllllllll4ssssss4lll443llllllllllllllllllllllllllllllllll
llllllllllllllllc777777clllllllllllllllllll44lllllllllllllllllllllllllllllllllll4ssssss4llllllllllllllllllllllllllllllllllllllll
llllllllllllllllc777777clllllllllllllllllllllllllllllllllllllllllllllllllllllll44ssssss4lllbbbllllllllllllllllllllllllllllllllll
llllllllllllllllc777777cllllllllllllllllllllllllllllllllllllllllllllllllllll444sssssss4lllb333blllllllllllllllllllllllllllllllll
llllllllllllllllc7cc777clllllllllllllllllllllllllllllllllllllllllllllllllll4ssssssssss4llb33333bllllllllllllllllllllllllllllllll
llllllllllllllllc777777cllllllllllllllllllllllllllllllllllllllllllllllllll4sssssssssss4ll3333333llllllllllllllllllllllllllllllll
llllllllllllllllc777777clllllllllllllllllllllllllllllllllllllllllllllllll4sssssssssss4lll333333lllllllllllllllllllllllllllllllll
llllllllllllllllc777777clllllllllllllllllllllllllllllllllllllllllllllllll4sssssssss44lllll333333llllllllllllllllllllllllllllllll
llllllllllllllllc777cc7cllllllllllllllllllllllllllllllllllllllllllllllll4ssssssss44llllllll443llllllllllllllllllllllllllllllllll
llllllllllllllllc777777cllllllllllllllllllllllllllllllllllllllllllllllll4ssssss44lllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllbbbllc777777cccllllllllllllllllllllllllllllllllllllllllllllll4ssssss4llllllllllllllllllllllllllllllllllllllllllllllll
llllllllllb333blc777777777cccllllllllllllllllllllllllllllllllllllllllllll4sssss4llllllllllllllllllllllllllllllllllllllllllllllll
lllllllllb33333bc777cc7777777clllllllllllllllllllllllllllllllllllllllllll4sssss4llllllllllllllllllllllllllllllllllllllllllllllll
lllllllll3333333lc777777777777cllllllllllllllllllllllllllllllllllllllllll4sssss4llllllllllllllllllllllllllllllllllllllllllllllll
lllllllll333333lllc77777777c77clllllllllllllllllllllllllllllllllllllllll4sssss4lllll3lllllll3lllllllllllllllllllllllllllllllllll
llllllllll333333lllcc77777c777clllllllllllllllllllllllllllllllllllllllll4sssss4llll333lllll333llllllllllllllllllllllllllllllllll
lllllllllll443lllllllcc7777777cllllllllllllllllllllllllllllllllllllllllll44ss4llllll4lllllll4lllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllcc777777clllllllllllllllllllllllllllllllllllllllllll44lllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllc777777clllbbbllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllc77777cllb333blllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllc77777clb33333bllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllc77777cl3333333llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllc77777cll333333lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllc77777clll333333llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllcc77clllll443llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll0000llllllllllllllllllllllllll
lllllllllllllllllllllllllllccllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll044440lllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll04444440llllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll04944440llllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll04994440llllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll3lllllllllllllllllllllllllllllllll04444440llllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllll3lll3llllllllllllllllllllllllllllllllll044440lllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllll3lllllllllllllllllllllllllllllllllllllll0000llllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll

__gff__
003e3e0a3e3e00000000000000000000000000000000000000000000000000003e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000c200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000244400000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000d2000000032444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000011104030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000100000000074440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000015100054848434244400d20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000005000064000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000005000000000000543400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000325450000000000640000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000650300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000c200000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000001400000014000000000000000000000000000006000314000000000314000000001400b200000000000114100300061400000000000003140000d2000000060000005585859595450000000014000000d2001406000000b20000000000000000000000060003140000000000000000000000000000000000
00000000000354843400000004000000000000060606060614000006030374440000000004000010006403000000000000032444000006030000001400000064000000000000060000000503030303050000000004000000000004000000000000c2000000000000000000060303744400000000000000000000000000000000
000000000000041000000000040000000000000600000054340000060354340400000800040000000000000000000000000003244400000000000004000000000000000006000000c20005030000030500c200000400000000000400000014000000000000000000000000060354340400000000000000000000000000000000
0000c20000000410001010000400000000000006000054340606060603640304000000000400000000000000000000000000000304000000000000040600b20000005585859545000000050300d20305000000000400000000000400000364000000000000000000060606060304030400000000000000000000000000000000
0000000000000400000054843400d200000000060000040006b200000303060400d20000744400000000000000000010000000002444000000000004060606060001430003030500000005030000030500000000744400000000040000000000000000000000d20006b200000364000400000000000000000000000000000000
0000000000000403000004000000000000000006000004000600000000000664000000000424440000000000000300140000000000744400000000249494440600080503000305000000050300035535000000000404000000000400000000000000000000000000060300000303000400000000000000000000000000000000
0000000354843400000304030000000006060606000074440606060606000600001000000400040000d20000005484340000000000047494a40000000000249400000503000305000003430000004300000008543424440000000400000000d20606060606060606061406060000000400000000000000000000000000000000
0000000064000000100004100000000000000000000004244400000000c20600000000000400040000000000006400000000005484342494944400000000000000000503000305000385350600000503000000040303244500082494949444000300000000000000006400000000002400000000000000000000000000000000
0000000000000000000074440000000000000000080004002444000000000600000000543400244400000000000000000010543400000010002444000000000000004303000305030000060000000503000000040300030500000000000024941403080000000000000000000000001000000000000000000000000000000000
000000000000d2000000042494949444000000c200000400002494944400060600005434000000249444000000000000000004001000000000007444000000000000050300034303000000000055350300000005030003050000000000000000244403000000000014000000c200000000000000000000000000000000000000
00000000000000000000040000000024000000000000744400000300040000000054340000000000000400000000000000000400000008000054b46400000000858535031003050306000055853503000000000503100305000000c2000000000024440300000000249494440000000000000000000000000000000000000000
000000000800000000000400b200000300000000000004244400000004000000543400000000000000040000000000000000244400000000106464000000000000030300000375a50606060503030000d20000254503030500000000000000000000244400030054848484340000000000000000000000000000000000000000
0000000000000000000004000000000000000000000004000400d2000400000034000000c200000000040000000000d20000000400000000031400000000000000000000000305000054843500000000000000100500030500000003140000000000000400000324949444000000000000000000000000000000000000000000
000000c20000000000002494949494940000000000543400040000000400100000000000000000000004000000000000000000244400000000749444000000000000000000032545000400000000001500000055350303050000000324a400000000002444000301100064000000d20000000000000000000000000000000000
0000000000000000000000030000000000001000000400000400000004000000000000000000000000040000c20000000000000064548484843400249494a40000000000000303050004000000000365000000050300030503000001010000000000000004000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000004000004000054340000000000000000000000000400000000000000000000006400000000000000000000000000c2000003650004000006d200b2000000050000034303000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
011800200c0351004515055170550c0351004515055170550c0351004513055180550c0351004513055180550c0351104513055150550c0351104513055150550c0351104513055150550c035110451305515055
010c0020102451c0071c007102351c0071c007102251c007000001022510005000001021500000000001021013245000001320013235000001320013225000001320013225000001320013215000001320013215
003000202874028740287302872026740267301c7401c7301d7401d7401d7401d7401d7301d7301d7201d72023740237402373023720267402674026730267201c7401c7401c7401c7401c7301c7301c7201c720
0030002000040000400003000030020400203004040040300504005040050300503005020050200502005020070400704007030070300b0400b0400b0300b0300c0400c0400c0300c0300c0200c0200c0200c020
00180020176151761515615126150e6150c6150b6150c6151161514615126150d6150e61513615146150e615136151761517615156151461513615126150f6150e6150a615076150561504615026150161501615
00180020010630170000000010631f633000000000000000010630000000000000001f633000000000000000010630000000000010631f633000000000000000010630000001063000001f633000000000000000
001800200e0351003511035150350e0351003511035150350e0351003511035150350e0351003511035150350c0350e03510035130350c0350e03510035130350c0350e03510035130350c0350e0351003513035
011800101154300000000001054300000000000e55300000000000c553000000b5630956300003075730c00300000000000000000000000000000000000000000000000000000000000000000000000000000000
003000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01240020051450c145051450c145051450c145051450c145071450e145071450e145071450e145071450e1450d145141450d145141450d145141450d145141450c145071450c145071450c145071450c14507145
014800202174421740217402274024744247401f7441f7402074420740207401f7401d7401f7401c7441c7402174421740217402274024744247401c7441c7401d7441f740207402274024744247402474024745
012400200e145151450e145151450e145151450e145151450c145131450c145131450c145131450c145131450f145161450f145161450f145161450f145161450e145151450e145151450c145131450c14513145
011200200c1330960509613096131f6330960509615096150c1330960509613096130062309605096050e7130c1330960509613096131f6330960509615096150c1330960509613096130062309605096050e713
014800200c5240c5200c5200c52510524105201052010525115241152011520115251352413520135201352511524115201152011525135241352013520135251452414520145201452013520135201352013525
014800200573405730057300573507734077300773007735087340873008730087350c7340c7300c7300c73505734057300573005735077340773007730077350d7340d7300d7300d7350c7340c7300c7300c735
014800200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
013200202005420050200502005520054200502005020055200542005020050200551e0541e0501c0541c05023054230502305023055210542105020054200501c0541c0501c0501c0501c0501c0501c0501c055
0132002025054250502505025055230542305021054210502805428050280502805527054270502305423050250542505025050250551e0541e0501e0501e0552305423050230502305023050230502305023055
0132002010140171401914014140101401714019140141400f14014140171401b1400f14014140171401b1400d1401014015140141400d1401014017140191400d1401014015140141400d140101401714019140
0132002015140191401c1401914015140191401c1401914014140191401b14017140121401414015140191401e1401914015140191401214014140151401914017140141401014012140171401e1401b14017140
013200202372423720237202372523724237202372023725237242372023720237252172421720207242072028724287202872028725257242572023724237202072420720207202072020720207202072020725
0132002028724287202872028725287242872028720287252c7242c7202c7202c7252a7242a72028724287202a7242a7202a7202a725257242572025720257252872428720287202872527724277202772027725
0019002001610016110161101611016110161104611076110b61112611166111b6112061128611306113561138611336112d6112961125611206111c6111861112611106110c6110861104611026110261101611
011e00200c505155351853517535135051553518535175350050015535185351a5350050515535185351a53500505155351c5351a53500505155351c5351a53500505155351a5351853500505155351a53518535
010f0020001630020000143002000f655002000020000163001630010000163002000f655001000010000163001630010000163002000f655002000010000163001630f65500163002000f655002000f60300163
013c002000000090750b0750c075090750c0750b0750b0050b0050c0750e075100750e0750c0750b0750000000000090750b0750c0750e0750c0751007510005000000e0751007511075100750c0751007510005
013c00200921409214092140921409214092140421404214022140221402214022140221402214042140421409214092140921409214092140921404214042140221402214022140221402214022140421404214
013c00200521405214052140521404214042140721407214092140921409214092140b2140b214072140721405214052140521405214042140421407214072140921409214092140921409214092140921409214
013c00202150624506285060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011400181862500000000001862518625186251862500000186051862018625000001862500000000001862500000000001862518605186251862518605186250000000000000000000000000000000000000000
010f00200c0730000018605000000c0730000000000000000c0730000000000000000c0730000000000000000c0730000000000000000c0730000000000000000c0730000000000000000c073000000000000000
013c0020025500255004550055500455004550055500755005550055500755007550045500455000550005500255002550045500555004550045500555007550055500555007550095500a550095500755009550
013c00201a54526305155451a5451c545000001a5451c5451d5451c5451a545185451a5450000000000000001a5452100521545180051c5450000018545000001a545000001c545000001a545000000000000000
011e00200557005575025650000002565050050557005575025650000002565000000457004570045750000005570055750256500000025650000005570055750256500000025650000007570075700757500000
013c00200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
013c00201d1151a1151a1151d1151a1151a1151c1201c1251d1151a1151a1151d1151a1151a1151f1201f1251d1151a1151a1151d1151a1151a1151c1201c1251d1151a1151a1151d1151a1151a1151f1201f125
011e0020091351500009135000050920515000091350000009145000000920500000071400714007145000000913500000091350000009205000000913500000091450000009205000000c2000c2050020000000
015000200706007060050600506003060030600506005060030600306005060050600206002060030600306007060070600506005060030600306005060050600306003060050600506007060070600706007060
01280020131251a1251f1251a12511125181251d125181250f125161251b125161250e125151251a125151250f125161251b1251612511125181251d125181250e125151251a125151251f1251a125131250e125
01280020227302273521730227301f7301f7301f7301f7352473024735227302273521730217351d7301d7351f7301f7352173022730217302173522730247302673026730267302673500000000000000000000
012800202773027735267302473524730247302473024735267302673524730267352273022730227302273524730247352273021735217302173021730217351f7301f7301f7301f7301f7301f7301f7301f735
015000200f0600f0600e0600e060070600706005060050600c0600c060060600606007060090600a0600e0650f0600f0600e0600e060070600706005060050600c0600a060090600206007060070600706007065
012800200f125161251b125161250e125151251a12515125131251a1251f1251a12511125181251d125181250f125161251b125161250e125151251a12515125131251a1251f1251a125131251a1251f1251a125
012800201a5201a525185201a525135101351013510135151b5201b5251a5201a525185201852515520155251652016525185201a52518520185251a5201b520155201552015520155251f5001f5001f5001f505
012800201f5201f5251d5201b525155101551015510155151d5201d5251b5201d5251a5101a5101a5101a5151b5201b5251a5201a52518520185201552015525165201652016520165251a5001a5001a5001a505
013c00201003500500000001003509000000000e0300e0351003500000000001003500000000000e0000e00511035000000000011035000000000010030100351103500000000001103500000000000400004005
011e00201813518505000001713517505000001513515505000001013010130101350000000000000000000015135000000000010135000000000011500115001150011500111301113011130111350000000000
01180020071550e1550a1550e155071550e1550a1550e155071550e1550a1550e155071550e1550a1550e155051550c155081550c155051550c155081550c155051550c155081550c155051550c137081550c155
01180020071550e1550a1550e155071550e1550a1550e155071550e1550a1550e155071550e1550a1550e155081550f1550c1550f155081550f1550c1550f155081550f1550c1550f155081550f1370c1550f155
01180020081550f1550c1550f155081550f1550c1550f155081550f1550c1550f155081550f1550c1550f155071550e1550a1550e155071550e1550a1550e155071550e1550a1550e155071550e1370a1550e155
011800201305015050160501605016050160551305015050160501605016050160551605015050160501a05018050160501805018050180501805018050180550000000000000000000000000000000000000000
011800201305015050160501605016050160551305015050160501605016050160551605015050160501a0501b0501b0501b0501b0501b0501b0501b0501b0550000000000000000000000000000000000000000
011800201b1301a1301b1301b1301b1301b1351b1301a1301b1301b1301b1301b1351b1301a1301b1301f1301a130181301613016130161301613016130161350000000000000000000000000000000000000000
011800201b1301a1301b1301b1301b1301b1351b1301a1301b1301b1301b1301b1351b1301a1301b1301f1301d1301d1301d1301d1301d1301d1301d1301d1350000000000000000000000000000000000000000
01180020081550f1550c1550f155081550f1550c1550f155081550f1550c1550f155081550f1550c1550f1550a155111550e155111550a155111550e155111550a155111550e155111550a155111550e15511155
011800202271024710267102671026710267152271024710267102671026710267152671024710267102971027710267102471024710247102471024710247150000000000000000000000000000000000000000
01180020227102471026710267102671026715227102471026710267102671026715267102471026710297102b7102b7102b7102b7102b7102b7102b7102b7150000000000000000000000000000000000000000
011800202b720297202b7202b7202b7202b7252b720297202b7202b7202b7202b7252b720297202b7202e72029720277202672026720267202672026720267250000000000000000000000000000000000000000
011800202b720297202b7202b7202b7202b7252b720297202b7202b7202b7202b7252b720297202b7202e7202e7202e7202e7202e7202e7202e7202e7202e7250000000000000000000000000000000000000000
010c00200c133000000061500615176550000000615006150c133000000061500615176550000000615006150c133000000061500615176550000000615006150c13300000006150061517655000000061500615
0118002002070020700207002070040700407004070040700c0700c0700c0700c0700a0700a0700a0700a0700e0700e0700e0700e0700d0700d0700d0700d070100701007010070100700e0700e0700e0700e075
011800200000015540155401554015545115401154011540115451354013540135401354510540105401054010545115401154011540115451054010540105401054513540135401354013545095400954009545
0118002009070090700907009070070700707007070070700907009070090700907002070020700207002070030700307003070030700a0700a0700a0700a0700707007070070700707007070070700707007075
01180020000001054010540105401054511540115401154011545105401054010540105450e5400e5400e5400e545075400754007540075450e5400e5400e5400e54505540055400554005540055400554005545
__music__
01 08004243
00 08014300
00 03014300
00 02030500
00 02030500
00 03414300
00 08014500
00 03040500
00 03020500
00 03020500
02 08010706
01 0a4d0949
00 0a0d090c
00 0a4c0b4c
00 0a0d0e4e
02 0f4d0c09
01 10124316
00 11134316
00 10121416
00 11131516
00 12424316
02 13424316
01 19425b18
00 19175a18
00 19171a18
00 1b425c18
02 1a194318
01 1f1d5e60
00 1f1d5e20
00 1f1d4320
00 221d211e
00 231d211e
02 1c1d2444
01 25262744
00 292a2844
00 2526272b
02 292a282c
01 2d181e24
00 2d181e24
00 2d181e2e
00 2d181e2e
00 2d181e6e
02 2d181e6e
01 2f454305
00 30424305
00 2f324344
00 30334344
00 2f323705
00 30333805
00 31344344
00 36354344
00 31343905
02 36353a05
01 3c423b41
00 3c423b44
00 3c3d3b44
00 3c3d3b44
00 3e523b41
00 3e423b41
00 3e3f3b44
00 3e3f3b44
00 3e013b41
02 3e013b41

