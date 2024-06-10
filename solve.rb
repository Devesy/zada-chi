# frozen_string_literal: true

# @param {String} query_ip
# @return {String}
def valid_ip_address(query_ip)
    return 'Neither' if query_ip == '' || query_ip.nil?

    parts = []
    if query_ip.include? '.'
        return 'Neither' if query_ip.each_char.filter { |c| c == '.' }.length > 3

        parts = query_ip.split('.').filter { |p| p.length > 0 }
        return 'Neither' if parts.length < 4

        return parts.all? { |p| (p.length > 0 && !p.start_with?('0') || p == '0') && p.each_char.all? { |s| valid_v4_symbol?(s) } && p.to_i >= 0 && p.to_i <= 255 } ? 'IPv4' : 'Neither'
    elsif query_ip.include? '::'
        return 'Neither'
    elsif query_ip.include? ':'
        return 'Neither' if query_ip.each_char.filter { |c| c == ':' }.length > 7

        parts = query_ip.split(':').filter { |p| p.length > 0 }
        return 'Neither' if parts.length < 8

        return parts.all? { |p| p.length >= 1 && p.length <= 4 && p.each_char.all? { |s| valid_v6_symbol?(s) } } ? 'IPv6' : 'Neither'
    end
    'Neither'
end

def valid_v4_symbol?(s)
    '0123456789'.chars.include? s
end

def valid_v6_symbol?(s)
    '0123456789abcdefABCDEF'.chars.include? s
end
