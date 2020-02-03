module BuilderPopulate
  module SslHelpers
    def i_p(ip, p=443, c=5)
      require 'openssl'
      w_soc(ip, p, c)
      ctx = OpenSSL::SSL::SSLContext.new
      sock = TCPSocket.new(ip, p)
      ssl = OpenSSL::SSL::SSLSocket.new(sock, ctx)
      ssl.connect
      x = ssl.peer_cert.issuer.to_a.select{ |c| c.include?('CN') }.first[1]
      y = ssl.peer_cert.to_pem
      return x,y,ip
    end
    def w_soc(ip, p=443, c=5)
      status = 'closed'
      count = 0
      while (count <= c)
        begin
          socket = TCPSocket.new(ip, p)
          break
        rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
          count += 1
          sleep 1
          next
        end
      end
    end
  end
end

