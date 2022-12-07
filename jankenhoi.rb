# Rps means Rock paper scissors
matchResult = 0
rpsResult = 0
dealerHand = nil
playerHand = nil
dealerHandString = nil
playerHandString = nil

fingerResult = 0
dealerDirection = nil
playerDirection = nil
dealerDirectionString = nil
playerDirectionString = nil

IntroMessage = "じゃんけん\n0(グー)1(チョキ)2(パー)3(戦わない)"
StartPlayingMessage = "ホイ！"
DrawMessage = "あいこで...\n0(グー)1(チョキ)2(パー)3(戦わない)"
FingerGameMessage = "あっち向いて～\n0(上)1(下)2(左)3(右)"
rpsMonitorMessage = nil
fingerMonitorMessage = nil
WinnerMessage = "あなたの勝ちです"
LooserMessage = "あなたの負けです"
QuitMessage = "ゲームを終了しました"

def MakeDealerHand
	return rand(0..2)
end

def MakePlayerHand
	return gets.to_i
end

def RpsStringMaker(hand)
	case hand 
	when 0
		return "グー"
	when 1
		return "チョキ"
	when 2
		return "パー"
	end
end

def MakeDealerDirection()
	return rand(0..3)
end

def MakePlayerDirection()
	return gets.to_i
end

def FingerStringMaker(direction)
	case direction
	when 0
		return "上"
	when 1
		return "下"
	when 2
		return "左"
	when 3
		return "右"
	end
end

def JudgeRpsResult(playerHandInt, dealerHandInt)
	# じゃんけんの勝敗決定の法則性をもとに勝敗を判定
	return (playerHandInt - dealerHandInt + 3) % 3
end

def JudgeFingerResult(playerDirectionInt, dealerDirectionInt)
	if playerDirectionInt == dealerDirectionInt then
		return 1
	else
		return 0
	end
end

while matchResult == 0 do
	# first rsp match
	puts IntroMessage
	playerHand = MakePlayerHand()
	if !(playerHand == 3) then
		puts StartPlayingMessage
		dealerHand = MakeDealerHand()
		rpsResult = JudgeRpsResult(playerHand, dealerHand)

		playerHandString = RpsStringMaker(playerHand)
		dealerHandString = RpsStringMaker(dealerHand)
		puts rpsMonitorMessage = "----------\nあなた：#{playerHandString}を出しました\n相手：#{dealerHandString}を出しました\n----------"
	else
	end
	#rps tied
	while rpsResult == 0 && !(playerHand == 3) do
		puts DrawMessage
		playerHand = MakePlayerHand()
		puts StartPlayingMessage
		dealerHand = MakeDealerHand()
		rpsResult = JudgeRpsResult(playerHand, dealerHand)

		playerHandString = RpsStringMaker(playerHand)
		dealerHandString = RpsStringMaker(dealerHand)
		puts rpsMonitorMessage = "----------\nあなた：#{playerHandString}を出しました\n相手：#{dealerHandString}を出しました\n----------"
	end

	# rps won/lost
	if fingerResult == 0 && !(playerHand == 3) then
		puts FingerGameMessage
		playerDirection = MakePlayerDirection()
		dealerDirection = MakeDealerDirection()
		fingerResult = JudgeFingerResult(playerDirection, dealerDirection)

		puts StartPlayingMessage
		playerDirectionString = FingerStringMaker(playerDirection)
		dealerDirectionString = FingerStringMaker(dealerDirection)
		puts fingerMoniterMessage = "----------\nあなた：#{playerDirectionString}\n相手：#{dealerDirectionString}\n----------"
		if fingerResult == 1 then
			if rpsResult == 2 then 
				puts WinnerMessage
				matchResult = 1
			elsif rpsResult == 1 
				puts LooserMessage
				matchResult = 1
			end
		else
		end
	end

	# if player wants to quit
	if playerHand == 3 then
		puts QuitMessage
		matchResult = 1
	end
end
