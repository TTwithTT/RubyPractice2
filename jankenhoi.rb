# Rps means Rock paper scissors
RpsResult = 0
DealerHand = nil
PlayerHand = nil
DealerHandString = nil
PlayerHandString = nil
FingerResult = 0
DealerDirection = nil
PlayerDirection = nil
DealerDirectionString = nil
PlayerDirectionString = nil
IntroMessage = "じゃんけん\n0(グー)1(チョキ)2(パー)3(戦わない)"
StartPlayingMessage = "ホイ！"
DrawMessage = "あいこで...\n0(グー)1(チョキ)2(パー)3(戦わない)"
FingerGameMessage = "あっち向いて～\n0(上)1(下)2(左)3(右)"
RpsMonitorMessage = "----------\nあなた：#{PlayerHandString}を出しました\n相手：#{DealerHandString}を出しました\n----------"
MonitorMessage = "----------\nあなた：#{PlayerDirectionString}\n相手：#{DealerDirectionString}\n----------"


puts IntroMessage

PlayerHand = MakePlayerHand()
puts StartPlayingMessage
DealerHand = MakeDealerHand()
PlayerHandString = RockpaperscissorsStringMaker(PlayerHand)
DealerHandString = RockpaperscissorsStringMaker(DealerHand)
puts RpsMonitorMessage
RpsResult = JudgeRpsResult(PlayerHand, DealerHand)

if RpsResult == 0 then
	while RpsResult == 0 do
		puts DrawMessage
		PlayerHand = MakePlayerHand()
		puts StartPlayingMessage
		DealerHand = MakeDealerHand()
		PlayerHandString = RockpaperscissorsStringMaker(PlayerHand)
		DealerHandString = RockpaperscissorsStringMaker(DealerHand)
		puts RpsMonitorMessage
		RpsResult = JudgeRpsResult(PlayerHand, DealerHand)
	end
end

if RpsResult == 1 then
	puts FingerGameMessage
elsif RpsResult == 2 
	puts FingerGameMessage
end

def MakeDealerHand
	return DealerHand = rand(0..2)
end

def MakePlayerHand
	return PlayerHand = gets.to_i
end

def RpsStringMaker(Hand)
	case Hand 
	when 0
		HandString = "グー"
	when 1
		HandString = "チョキ"
	when 2
		HandString = "パー"
	end
	return HandString


def FingerGameStringMaker(Direction)
	case Direction
	when 0
		DirectionString = "上"
	when 1
		DirectionString = "下"
	when 2
		DirectionString = "左"
	when 3
		DirectionString = "右"
	end
	retrun DirectionString
end

def JudgeRpsResult(PlayerHand, DealerHand)
	# じゃんけんの勝敗決定の法則性をもとに勝敗を判定
	RpsResult = (PlayerHand - DealerHand + 3) % 3
	return RpsResult
end

