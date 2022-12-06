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
FingerMonitorMessage = "----------\nあなた：#{PlayerDirectionString}\n相手：#{DealerDirectionString}\n----------"
WinnerMessage = "あなたの勝ちです"
LooserMessage = "あなたの負けです"

puts IntroMessage

MakePlayerHand()
puts StartPlayingMessage
MakeDealerHand()
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
		RpsStringMaker(PlayerHand)
		RpsStringMaker(DealerHand)
		puts RpsMonitorMessage
		JudgeRpsResult(PlayerHand, DealerHand)
	end
end

if RpsResult == 1 then
	FingerGame()
	puts WinnerMessage
elsif RpsResult == 2 
	FingerGame()
	puts LooserMessage
else
end

def MakeDealerHand
	return rand(0..2)
end

def MakePlayerHand
	return gets.to_i
end

def RpsStringMaker(Hand)
	case Hand 
	when 0
		return "グー"
	when 1
		return "チョキ"
	when 2
		return "パー"
	end
end

def MakeDealerDirection
	return rand(0..3)
end

def MakePlayerDirection
	return gets.to_i
end

def FingerStringMaker(Direction)
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
end

def FingerGame()
	puts FingerGameMessage
	while FingerResult == 0 do
		MakePlayerDirection()
		MakeDealerDirection()
		JudgeFingerResult(PlayerDirection, DealerDirection)
		puts FingerMoniterMessage
	end
end

def JudgeRpsResult(PlayerHandInt, DealerHandInt)
	# じゃんけんの勝敗決定の法則性をもとに勝敗を判定
	RpsResult = (PlayerHandInt - DealerHandInt + 3) % 3
end

def JudgeFingerResult(PlayerDirectionInt, DealerDirectionInt)
	if PlayerDirectionInt == DealerDirectionInt then
		FingerResult = 1
	else
	end
end