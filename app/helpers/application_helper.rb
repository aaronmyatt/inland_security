module ApplicationHelper

    def figure(path)
        render :partial => "shared/figure", :locals => {:path => path}
    end

end
