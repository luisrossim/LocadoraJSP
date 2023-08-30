package passatempo.model.application;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import passatempo.model.domain.Ator;
import passatempo.utils.PersistenceUtil;
import javax.persistence.NoResultException;
import javax.persistence.criteria.*;

public class AtorApp extends GenericApp {
    private Ator pesquisar(String pesq, Integer type) throws HibernateException {
        Session sessao = null;
        Ator ator = null;

        try {
            sessao = PersistenceUtil.getSessionFactory().openSession();
            sessao.beginTransaction();

            CriteriaBuilder builder = sessao.getCriteriaBuilder();
            CriteriaQuery consulta = builder.createQuery(Ator.class);
            Root tabela = consulta.from(Ator.class);

            Expression result = null;
            Predicate restricoes = null;

            result = tabela.get("id_ator");
            restricoes = builder.equal(result, pesq);

            consulta.where(restricoes);
            ator = (Ator) sessao.createQuery(consulta).getSingleResult();

            sessao.getTransaction().commit();
            sessao.close();

        } catch (NoResultException ex) {
           return null;
        } catch (HibernateException ex) {
            if (sessao != null) {
                sessao.getTransaction().rollback();
                sessao.close();
            }
            throw new HibernateException(ex);
        }
        return ator;
    }


    public Ator findById(String id_ator) {
        return pesquisar(id_ator, 1);
    }

}
