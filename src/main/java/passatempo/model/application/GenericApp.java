package passatempo.model.application;

import jdk.jfr.Description;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import java.util.List;
import javax.persistence.criteria.CriteriaQuery;
import passatempo.utils.PersistenceUtil;

public class GenericApp {
    public void inserir(Object obj) throws HibernateException {

        Session sessao = null;

        try {
            sessao = PersistenceUtil.getSessionFactory().openSession();
            sessao.beginTransaction();

            sessao.save(obj);

            sessao.getTransaction().commit();
            sessao.close();
        } catch(HibernateException erro) {
            if (sessao != null ){
                sessao.getTransaction().rollback();
                sessao.close();
            }
            throw new HibernateException(erro);
        }
    }

    public void alterar(Object obj) throws HibernateException {
        Session sessao = null;

        try {
            sessao = PersistenceUtil.getSessionFactory().openSession();
            sessao.beginTransaction();

            sessao.update(obj);

            sessao.getTransaction().commit();
            sessao.close();
        } catch(HibernateException erro) {
            if (sessao != null ){
                sessao.getTransaction().rollback();
                sessao.close();
            }
            throw new HibernateException(erro);
        }
    }

    public void excluir(Object obj) throws HibernateException {
        Session sessao = null;

        try {
            sessao = PersistenceUtil.getSessionFactory().openSession();
            sessao.beginTransaction();

            sessao.delete(obj);

            sessao.getTransaction().commit();
            sessao.close();
        } catch(HibernateException erro) {
            if (sessao != null ){
                sessao.getTransaction().rollback();
                sessao.close();
            }
            throw new HibernateException(erro);
        }
    }

    public List listar(Class classe) throws HibernateException {
        Session sessao = null;
        List lista = null;

        try {
            sessao = PersistenceUtil.getSessionFactory().openSession();
            sessao.beginTransaction();

            CriteriaQuery consulta = sessao.getCriteriaBuilder().createQuery(classe);
            consulta.from(classe);
            lista = sessao.createQuery(consulta).getResultList();

            sessao.getTransaction().commit();
            sessao.close();
        } catch(HibernateException erro) {
            if (sessao != null ){
                sessao.getTransaction().rollback();
                sessao.close();
            }
        }
        return lista;
    }
}
