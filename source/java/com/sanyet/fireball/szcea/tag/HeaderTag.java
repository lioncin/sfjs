package com.sanyet.fireball.szcea.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.TagSupport;

import com.sanyet.fireball.base.AppUtil;
import com.sanyet.fireball.base.util.StringUtil;
import com.sanyet.fireball.content.entity.Link;
import com.sanyet.fireball.content.service.LinkService;

/**
 * <ce:header tag="" />
 */
public class HeaderTag extends TagSupport {
    private static final long serialVersionUID = 1L;

    private String tag;

    public HeaderTag() {
        super();
        init();
    }

    // resets local state
    private void init() {
        tag = null;
    }

    // Releases any resources we may have (or inherit)
    public void release() {
        super.release();
        init();
    }
    
    public int doStartTag() throws JspException {
        try {
            String html = "";
            LinkService linkService = AppUtil.getBean(LinkService.class);
            Link[] links = null;
            if (StringUtil.isNotEmpty(tag)) {
                links = linkService.getLinks(tag);
            }
            if (links != null) {
                StringBuilder sb = new StringBuilder();
                sb.append("<div class=\"nav-container\">");
                int size = links.length;
                for (int i = 0; i < size; i++) {
                    Link link = links[i];
                    String url = pageContext.getServletContext().getContextPath()+link.getUrl();
                    if(i == size - 1){
                        sb.append("<div class=\"menu last\">");
                    }else{
                        sb.append("<div class=\"menu\">");
                    }
                    sb.append("<a href=\""+url+"\">");
                    sb.append(" <div class=\"ch\">"+link.getName()+"</div>");
                    sb.append(" <div class=\"en\">"+link.getTitle()+"</div>");
                    sb.append("</a>");
                    String subLinksString = getSinks(link.getId());
                    if(subLinksString!=""){
                        sb.append("<ul class='sublinks hidden'>"+subLinksString+"</ul>");
                    }
                    sb.append("</div>");
                }
                sb.append("<div class=\"cls\"></div>");
                sb.append("</div>");
                html = sb.toString();
            }

            pageContext.getOut().print(html);
        } catch (Exception ex) {
            throw new JspTagException("LinkTag: " + ex.getMessage());
        }
        return SKIP_BODY;
    }

    private String getSinks(int linkId){
        LinkService linkService = AppUtil.getBean(LinkService.class);
        Link[] links = linkService.getSubLinks(linkId);
        if(links != null && links.length > 0){
            int size = links.length;
            StringBuilder sb = new StringBuilder();
            for(int i=0;i<size;i++){
                Link link = links[i];
                String url = pageContext.getServletContext().getContextPath() + link.getUrl();
                sb.append("<li onclick=\"location.href='"+url+"'\">"+link.getName()+"</li>");
            }
            return sb.toString();
        }else{
            return "";
        }
    }
    
    public int doEndTag() {
        return EVAL_PAGE;
    }
    
    public void setTag(String tag) {
        this.tag = tag;
    }
    
}
