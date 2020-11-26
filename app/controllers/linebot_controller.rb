class LinebotController < ActionController::Base
    require 'line/bot'  # gem 'line-bot-api'
    require 'uri'
  
    # callbackアクションのCSRFトークン認証を無効
    protect_from_forgery :except => [:callback]
  
    def client
      @client ||= Line::Bot::Client.new { |config|
        config.channel_secret = '384e08ec2c84502a6bfad1c3d2c84fed'
        config.channel_token = 'l6uH+mp7nfvRqa5Iz2yCOvG+8C7v6ZavyVa6j9149UQFAiKZfc3F1VmbBHCSKYCMn7dqLLrTRpM+XXFjv0POixK0ZH2GfwEzZ9lXicJSb2XmX5SJ6NQA8/q4V5Q3wQSF/9Ti2IuDTxvYoeyKt8J7wAdB04t89/1O/w1cDnyilFU='
      }
    end
  
    def callback
  
    #   # Postモデルの中身をランダムで@postに格納する
      body = request.body.read
  
      signature = request.env['HTTP_X_LINE_SIGNATURE']
      unless client.validate_signature(body, signature)
        head :bad_request
      end
  
      events = client.parse_events_from(body)
  
      events.each { |event|
        txt = event.message['text']
        title = txt[/「(.*?)」/, 0]
        url = (URI.extract(txt, ["https"])).first
        @board = Board.new(title: title,name: '?',main: '?',url: url)
        if @board.save
            response = txt + 'を募集します。'
        else
            response = '招待のメッセージ以外張るんじゃねーよgm'
        end

        case event
            when Line::Bot::Event::Message
            case event.type
                when Line::Bot::Event::MessageType::Text
                    message = {
                    type: 'text',
                    text: response
                    }
                    client.reply_message(event['replyToken'], message)
                end
            end
      }
  
      head :ok
    end
  end