class UF
    attr_reader :count, :id, :sz
    def initialize(n)
        @count = n
        @id = Array.new(n) {|i| i}
        @sz = Array.new(n, 1)
    end

    def connected?(p, q)
        find(q) == find(p)
    end

    def union(p, q)
        p_root = find(p.to_i)
        q_root = find(q.to_i)
        return if p_root == q_root

        if (@sz[p_root] < @sz[q_root])
            @id[p_root] = q_root
            @sz[q_root] += @sz[p_root]
        else
            @id[q_root] = p_root
            @sz[p_root] += @sz[q_root]
        end

        @count -= 1
    end

    private
    def find(p)
        route = Array.new
        until (p == @id[p])
            route.push(p)
            p = @id[p] 
        end 
        route.each {|i| @id[i] = p}
        p
    end
end