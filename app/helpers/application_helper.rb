module ApplicationHelper
    #rendef_if in render cart
    def render_if(condition, record)
        if condition
            render record
        end
    end
end
