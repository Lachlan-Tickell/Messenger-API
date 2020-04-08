class JsonWebToken
    class << self
      def encode(payload, exp = 24.hours.from_now)
        payload[:exp] = exp.to_i
        #JWT.encode(payload, Rails.application.secrets.secret_key_base)
        JWT.encode(payload, "8ab003eef86aaf1035c61a5554dfafb52b3c6ee6262c6ddacf3486f0c1f2a21a29b7c05560087af1ecb8a3222dba11a468fcb0d7759d0b117f099cb4d0a9febe")
      end
   
      def decode(token)
        #body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
        body = JWT.decode(token, "8ab003eef86aaf1035c61a5554dfafb52b3c6ee6262c6ddacf3486f0c1f2a21a29b7c05560087af1ecb8a3222dba11a468fcb0d7759d0b117f099cb4d0a9febe")[0]
        HashWithIndifferentAccess.new body
      rescue
        nil
      end
    end
   end